using InsuranceManagementAPI.Data;
using InsuranceManagementAPI.Helper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Primitives;
using System.Text.Json;

namespace InsuranceManagementAPI.Controllers
{
    [ApiController, Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    public class PurchasePolicyController : Controller
    {
        private readonly Microsoft.AspNetCore.Hosting.IHostingEnvironment _environment;

        public PurchasePolicyController(Microsoft.AspNetCore.Hosting.IHostingEnvironment hostingEnvironment)
        {
            _environment = hostingEnvironment;
            _environment.WebRootPath = "c:\\Temp\\wwwroot\\";
        }

        [HttpGet]
        [Route("{personId}")]
        public async Task<IActionResult> GetPurchasePolicies([FromRoute] string personId)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PersonId", personId)
            };
            return Ok(await DbHelper.Instance.GetData<GetPurchasePolicy>("SSP_GetPurchasedPolicies", parameters));
        }

        [HttpPost]
        [Route("{personId}")]
        public async Task<IActionResult> PurchasePolicy([FromRoute] string personId)
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
            HttpContext.Request.Form.TryGetValue("policyDetail", out jsonData);

            AddPurchasePolicy addPurchasePolicy = JsonSerializer.Deserialize<AddPurchasePolicy>(jsonData.First());

            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PersonId", personId),
                new ProcedureParameter ("@PolicyID", addPurchasePolicy.policyID),
                new ProcedureParameter ("@VehicleChesisNo", addPurchasePolicy.vehicleChesisNo),
                new ProcedureParameter ("@PolicyStartDate", addPurchasePolicy.policyStartDate),
                new ProcedureParameter ("@PolicyEndDate", addPurchasePolicy.policyEndDate),
                new ProcedureParameter ("@InsuredDeclaredValue", addPurchasePolicy.insuredDeclaredValue),
                new ProcedureParameter ("@DocumentName", fileName),
                new ProcedureParameter ("@DocumentPath", path),
            };

            int insertedRecords = await DbHelper.Instance.UpdateData("SSP_PurchasePolicy", parameters);

            return insertedRecords >= 1 ? Ok(addPurchasePolicy) : this.Content("Error purchasing new policy");
        }

        [HttpGet]
        [Route("DownloadPolicyDocument/{customerPolicyID}/{documentName}")]
        public async Task<IActionResult> DownloadPolicyDocument([FromRoute] string customerPolicyID, [FromRoute] string documentName)
        {
            try
            {
                List<ProcedureParameter> parameters = new()
                {
                    new ProcedureParameter ("@CustomerPolicyID", customerPolicyID),
                    new ProcedureParameter ("@DocumentName", documentName),
                };

                string path = await DbHelper.Instance.GetFirstRecord<string>("SSP_GetPolicyDocumentPath", parameters);

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
    }
}
