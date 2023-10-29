using InsuranceManagementAPI.Data;
using InsuranceManagementAPI.Helper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace InsuranceManagementAPI.Controllers
{
    [ApiController, Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/[controller]")]
    public class PurchasePolicyController : Controller
    {
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
        public async Task<IActionResult> AddVehicle([FromRoute] string personId, AddPurchasePolicy addPurchasePolicy)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PersonId", personId),
                new ProcedureParameter ("@PolicyID", addPurchasePolicy.PolicyID),
                new ProcedureParameter ("@VehicleChesisNo", addPurchasePolicy.VehicleChesisNo),
                new ProcedureParameter ("@PolicyStartDate", addPurchasePolicy.PolicyStartDate),
                new ProcedureParameter ("@PolicyEndDate", addPurchasePolicy.PolicyEndDate),
                new ProcedureParameter ("@InsuredDeclaredValue", addPurchasePolicy.InsuredDeclaredValue),
                new ProcedureParameter ("@Status", addPurchasePolicy.Status),
            };

            int insertedRecords = await DbHelper.Instance.UpdateData("SSP_PurchasePolicy", parameters);

            return insertedRecords >= 1 ? Ok(addPurchasePolicy) : this.Content("Error purchasing new policy");
        }
    }
}
