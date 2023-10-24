using InsuranceManagementAPI.Data;
using InsuranceManagementAPI.Helper;
using Microsoft.AspNetCore.Mvc;

namespace InsuranceManagementAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class VehicleController : Controller
    {
        [HttpGet]
        [Route("{personId}")]
        public async Task<IActionResult> GetVehicles([FromRoute] string personId)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PersonId", personId)
            };
            return Ok(await DbHelper.Instance.GetData<Vehicle>("SSP_GetCustomerVehicles", parameters));
        }

        [HttpPost]
        [Route("{personId}")]
        public async Task<IActionResult> AddVehicle([FromRoute] string personId, Vehicle vehicle)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@PersonId", personId),
                new ProcedureParameter ("@VehicleChesisNo", vehicle.VehicleChesisNo),
                new ProcedureParameter ("@RegistrationNumber", vehicle.RegistrationNumber),
                new ProcedureParameter ("@TypeOfVehicle", vehicle.TypeOfVehicle),
                new ProcedureParameter ("@Make", vehicle.Make),
                new ProcedureParameter ("@Model", vehicle.Model),
                new ProcedureParameter ("@PurchaseDate", vehicle.PurchaseDate.ToString("yyyy-MM-dd")),
            };

            int insertedRecords = await DbHelper.Instance.UpdateData("SSP_AddVehicle", parameters);

            return insertedRecords >= 1 ? Ok(vehicle) : this.Content("Error creating new vehicle");
        }

        [HttpPut]
        public async Task<IActionResult> UpdateVehicle(Vehicle vehicle)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@VehicleChesisNo", vehicle.VehicleChesisNo),
                new ProcedureParameter ("@RegistrationNumber", vehicle.RegistrationNumber),
                new ProcedureParameter ("@TypeOfVehicle", vehicle.TypeOfVehicle),
                new ProcedureParameter ("@Make", vehicle.Make),
                new ProcedureParameter ("@Model", vehicle.Model),
                new ProcedureParameter ("@PurchaseDate", vehicle.PurchaseDate.ToString("yyyy-MM-dd")),
            };

            int insertedRecords = await DbHelper.Instance.UpdateData("SSP_UpdateVehicle", parameters);

            return insertedRecords >= 1 ? Ok(vehicle) : this.Content("Error updating vehicle");
        }

        [HttpDelete]
        [Route("{vehicleChesisNo}")]
        public async Task<IActionResult> DeleteVehicle([FromRoute] string vehicleChesisNo)
        {
            List<ProcedureParameter> parameters = new()
            {
                new ProcedureParameter ("@VehicleChesisNo", vehicleChesisNo),
            };

            int deletedRecords = await DbHelper.Instance.UpdateData("SSP_DeleteVehicle", parameters);

            return deletedRecords >= 1 ? Ok() : this.Content("Error deleting vehicle.");
        }
    }
}
