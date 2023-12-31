﻿using InsuranceManagementAPI.Data;
using InsuranceManagementAPI.Helper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using Claim = System.Security.Claims.Claim;

namespace InsuranceManagementAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class LoginController : Controller
    {
        IConfiguration _configuration;

        public LoginController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpPost]
        public async Task<IActionResult> ValidateUser(string userName, string password)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@UserName", userName),
                new ProcedureParameter ("@Password", password)
            };

            List<PersonLoginDetail> result = await DbHelper.Instance.GetData<PersonLoginDetail>("SSP_ValidateUser", parameters);

            if (result == null || result.Count < 1 || result[0] == null || string.IsNullOrEmpty(result[0].FirstName))
            {
                return Unauthorized();
            }
            else
            {
                //Try 1
                var claims = new[]
                            {
                    new Claim (JwtRegisteredClaimNames.Sub, _configuration["Jwt:Subject"]),
                    new Claim (JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                    new Claim (JwtRegisteredClaimNames.Iat, DateTime.UtcNow.ToString()),
                    new Claim ("PersonId", result[0].FirstName),
                    new Claim ("UserName", userName),
                };

                var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
                var signIn = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
                var token = new JwtSecurityToken(_configuration["Jwt:Issuer"],
                                                 _configuration["Jwt:Audience"],
                                                 claims,
                                                 expires: DateTime.UtcNow.AddMinutes(5),
                                                 signingCredentials: signIn);

                string jwtToken = new JwtSecurityTokenHandler().WriteToken(token);

                return Ok(new UserLogin(result[0].PersonId, result[0].FirstName, result[0].IsCustomer, jwtToken));
            }
        }
    }
}
