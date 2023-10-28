using InsuranceManagementAPI.Data;
using InsuranceManagementAPI.Helper;
using Microsoft.AspNetCore.Mvc;

namespace InsuranceManagementAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ClaimController : Controller
    {
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

        [HttpPost]
        [Route("{personId}")]
        public async Task<IActionResult> AddClaim([FromRoute] string personId, AddClaim claim)
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
