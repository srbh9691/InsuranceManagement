namespace InsuranceManagementAPI.Data
{
    public class Vehicle
    {
        public string VehicleChesisNo { get; set; }

        public string RegistrationNumber { get; set; }

        public string TypeOfVehicle { get; set; }

        public string Make { get; set; }

        public int Model { get; set; }

        public DateTime PurchaseDate { get; set; }
    }
}
