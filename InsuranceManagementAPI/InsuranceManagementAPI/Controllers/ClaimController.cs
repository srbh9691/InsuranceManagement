using InsuranceManagementAPI.Data;
using InsuranceManagementAPI.Helper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Primitives;
using System.Text.Json;

namespace InsuranceManagementAPI.Controllers
{
    [ApiController, Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    public class ClaimController : Controller
    {
        private readonly Microsoft.AspNetCore.Hosting.IHostingEnvironment _environment;

        public ClaimController(Microsoft.AspNetCore.Hosting.IHostingEnvironment hostingEnvironment)
        {
            _environment = hostingEnvironment;
            _environment.WebRootPath = "c:\\Temp\\wwwroot\\";
        }

        [HttpGet]
        [Route("{personId}")]
        public async Task<IActionResult> GetClaims([FromRoute] string personId)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PersonId", personId)
            };
            return Ok(await DbHelper.Instance.GetData<GetClaim>("SSP_GetClaims", parameters));
        }

        [HttpGet]
        [Route("DownloadClaimDocument/{claimID}/{documentName}")]
        public async Task<IActionResult> DownloadClaimDocument([FromRoute] string claimID, [FromRoute] string documentName)
        {
            try
            {
                List<ProcedureParameter> parameters = new()
                {
                    new ProcedureParameter ("@ClaimID", claimID),
                    new ProcedureParameter ("@DocumentName", documentName),
                };

                string path = await DbHelper.Instance.GetFirstRecord<string>("SSP_GetClaimDocumentPath", parameters);

                if (System.IO.File.Exists(path))
                {
                    return File(System.IO.File.OpenRead(path), "application/octet-stream", Path.GetFileName(path));
                }
                return NotFound();

            }
            catch (Exception ex)
            {
            }

            return Ok();
        }

        [HttpPost]
        public async Task<IActionResult> UploadClaim()
        {
            string path = string.Empty;
            string fileName = string.Empty;
            if (HttpContext.Request.Form.Files.Count > 0)
            {
                var file = HttpContext.Request.Form.Files[0];

                if (file != null && file.Length > 0)
                {
                    fileName = Path.GetFileName(file.FileName);
                    path = Path.Combine(_environment.WebRootPath, fileName);
                    if (!Directory.Exists(_environment.WebRootPath))
                    {
                        Directory.CreateDirectory(_environment.WebRootPath);
                    }
                    using (var stream = new FileStream(path, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }
                }
            }

            if (string.IsNullOrEmpty(path))
            {
                return this.Content("Error purchasing new policy");
            }

            StringValues jsonData;
            HttpContext.Request.Form.TryGetValue("claimID", out jsonData);

            string claimID = JsonSerializer.Deserialize<string>(jsonData.First());

            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@ClaimID", claimID),
                new ProcedureParameter ("@DocumentName", fileName),
                new ProcedureParameter ("@DocumentPath", path),
            };

            int insertedRecords = await DbHelper.Instance.UpdateData("SSP_AddUpdateClaimDocument", parameters);

            return insertedRecords >= 1 ? Ok(claimID) : this.Content("Error adding/updating clain document");
        }

        [HttpPost]
        [Route("{personId}")]
        public async Task<IActionResult> AddClaim([FromRoute] string personId, Claim claim)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PersonId", personId),
                new ProcedureParameter ("@CustomerPolicyID", claim.CustomerPolicyID),
                new ProcedureParameter ("@ClaimType", claim.ClaimType),
                new ProcedureParameter ("@DamageDetails", claim.DamageDetails),
                new ProcedureParameter ("@ClaimAmount", claim.ClaimAmount),
                new ProcedureParameter ("@IFSCCode", claim.IFSCCode),
                new ProcedureParameter ("@AccountNo", claim.AccountNo),
                new ProcedureParameter ("@AccountHolderName", claim.AccountHolderName),
            };

            int insertedRecords = await DbHelper.Instance.UpdateData("SSP_AddClaim", parameters);

            return insertedRecords >= 1 ? Ok(claim) : this.Content("Error creating new Claim");
        }

        [HttpPut]
        [Route("{personId}")]
        public async Task<IActionResult> ApproveClaim([FromRoute] string personId, ApproveClaim approveClaim)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PersonId", personId),
                new ProcedureParameter ("@ClaimID", approveClaim.ClaimID),
                new ProcedureParameter ("@ApprovedAmount", approveClaim.ApprovedAmount),
            };

            int insertedRecords = await DbHelper.Instance.UpdateData("SSP_ApproveClaim", parameters);

            return insertedRecords >= 1 ? Ok(approveClaim) : this.Content("Error creating approving Claim");
        }
    }
}
