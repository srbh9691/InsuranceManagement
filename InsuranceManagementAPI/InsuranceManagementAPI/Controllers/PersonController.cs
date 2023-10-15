using InsuranceManagementAPI.Data;
using InsuranceManagementAPI.Helper;
using Microsoft.AspNetCore.Mvc;

namespace InsuranceManagementAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PersonController : Controller
    {
        [HttpGet]
        [Route("{personId}")]
        public async Task<IActionResult> GetPersonDetails([FromRoute] string personId)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PersonId", personId)
            };
            return Ok(await DbHelper.Instance.GetData<Person>("SSP_GetPersonDetails", parameters));
        }

        [HttpGet]
        [Route("GetEmployees")]
        public async Task<IActionResult> GetEmployees()
        {
            return Ok(await DbHelper.Instance.GetData<Person>("SSP_GetEmployees"));
        }

        [HttpPost]
        public async Task<IActionResult> AddPerson(SavePerson person)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@FirstName", person.FirstName),
                new ProcedureParameter ("@LastName", person.LastName),
                new ProcedureParameter ("@PhoneNo", person.PhoneNo),
                new ProcedureParameter ("@UserName", person.UserName),
                new ProcedureParameter ("@Password", person.Password),
                new ProcedureParameter ("@IsActive", person.IsActive),
                new ProcedureParameter ("@EmailId", person.EmailId),
                new ProcedureParameter ("@DateOfBirth", person.DateOfBirth.ToString("yyyy-MM-dd")),
                new ProcedureParameter ("@HouseNo", person.HouseNo),
                new ProcedureParameter ("@Area", person.Area),
                new ProcedureParameter ("@City", person.City),
                new ProcedureParameter ("@Zip", person.Zip),
                new ProcedureParameter ("@IsCustomer", person.IsCustomer),
            };

            int insertedRecords= await DbHelper.Instance.UpdateData("SSP_AddPersonAccount", parameters);

            return insertedRecords >= 1 ? Ok(person) : this.Content("Error creating new person");
        }

        [HttpPut]
        [Route("{personId}")]
        public async Task<IActionResult> UpdatePerson([FromRoute] string personId, SavePerson person)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PersonId", personId),
                new ProcedureParameter ("@FirstName", person.FirstName),
                new ProcedureParameter ("@LastName", person.LastName),
                new ProcedureParameter ("@PhoneNo", person.PhoneNo),
                new ProcedureParameter ("@UserName", person.UserName),
                new ProcedureParameter ("@Password", person.Password),
                new ProcedureParameter ("@IsActive", person.IsActive),
                new ProcedureParameter ("@EmailId", person.EmailId),
                new ProcedureParameter ("@DateOfBirth", person.DateOfBirth.ToString("yyyy-MM-dd")),
                new ProcedureParameter ("@HouseNo", person.HouseNo),
                new ProcedureParameter ("@Area", person.Area),
                new ProcedureParameter ("@City", person.City),
                new ProcedureParameter ("@Zip", person.Zip),
                new ProcedureParameter ("@IsCustomer", person.IsCustomer),
            };

            int updatedRecords = await DbHelper.Instance.UpdateData("SSP_UpdatePerson", parameters);

            return updatedRecords >= 1 ? Ok(person) : Content("Error for updating person");
        }

        [HttpDelete]
        [Route("{personId}/{isCustomer}")]
        public async Task<IActionResult> DeletePerson([FromRoute] string personId, [FromRoute] bool isActive)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PersonId", personId),
                new ProcedureParameter ("@IsActive", isActive)
            };

            int deletedRecords = await DbHelper.Instance.UpdateData("SSP_MakePersonInactive", parameters);

            return deletedRecords >= 1 ? Ok() : this.Content("Error making person inactive.");
        }
    }
}
