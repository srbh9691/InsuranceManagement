using InsuranceManagementAPI.Data;
using InsuranceManagementAPI.Helper;
using Microsoft.AspNetCore.Mvc;

namespace InsuranceManagementAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PolicyController : Controller
    {
        public PolicyController() { }

        [HttpGet]
        public async Task<IActionResult> GetPolicies()
        {
            return Ok(await DbHelper.Instance.GetData<Policy>("SSP_GetPolicy"));
        }

        [HttpPost]
        public async Task<IActionResult> AddPolicy(Policy policy)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PolicyID", policy.PolicyID),
                new ProcedureParameter ("@Name", policy.Name),
                new ProcedureParameter ("@TypeOFPolicy", policy.TypeOfPolicy),
                new ProcedureParameter ("@Premium", policy.Premium)
            };

            int updatedRecords = await DbHelper.Instance.UpdateData("SSP_AddUpdatePolicy", parameters);

            return updatedRecords >= 1 ? Ok(policy) : this.Content("Error creating new policy");
        }

        [HttpPut]
        [Route("{PolicyID}")]
        public async Task<IActionResult> UpdatePolicy([FromRoute] string PolicyID, Policy policy)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PolicyID", policy.PolicyID),
                new ProcedureParameter ("@Name", policy.Name),
                new ProcedureParameter ("@TypeOFPolicy", policy.TypeOfPolicy),
                new ProcedureParameter ("@Premium", policy.Premium)
            };

            int updatedRecords = await DbHelper.Instance.UpdateData("SSP_AddUpdatePolicy", parameters);

            return updatedRecords >= 1 ? Ok(policy) : this.Content("Error updating policy");
        }

        [HttpDelete]
        [Route("{PolicyID}")]
        public async Task<IActionResult> DeletePolicy([FromRoute] string PolicyID)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PolicyID", PolicyID)
            };

            int deletedRecords = await DbHelper.Instance.UpdateData("SSP_DeletePolicy", parameters);

            return deletedRecords >= 1 ? Ok() : this.Content("Error deleting policy");
        }
    }
}
