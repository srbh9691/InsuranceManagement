using InsuranceManagementAPI.Data;
using InsuranceManagementAPI.Helper;
using Microsoft.AspNetCore.Mvc;

namespace InsuranceManagementAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PersonController : Controller
    {
        [HttpPost]
        public async Task<IActionResult> AddPolicy(Person person)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@FirstName", person.FirstName),
                new ProcedureParameter ("@LastName", person.LastName),
                new ProcedureParameter ("@PhoneNo", person.PhoneNo),
                new ProcedureParameter ("@UserName", person.UserName),
                new ProcedureParameter ("@Password", person.Password),
                new ProcedureParameter ("@EmailId", person.EmailId),
                new ProcedureParameter ("@DateOfBirth", person.DateOfBirth),
                new ProcedureParameter ("@HouseNo", person.HouseNo),
                new ProcedureParameter ("@Area", person.Area),
                new ProcedureParameter ("@City", person.City),
                new ProcedureParameter ("@Zip", person.Zip)
            };

            int updatedRecords = await DbHelper.Instance.UpdateData("SSP_AddUserAccount", parameters);

            return updatedRecords >= 1 ? Ok(person) : this.Content("Error creating new account");
        }
    }
}
