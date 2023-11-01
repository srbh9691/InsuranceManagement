namespace InsuranceManagementAPI.Data
{
    public class PurchasePolicy
    {
        public string VehicleChesisNo { get; set;}
        public DateTime PolicyStartDate { get; set;}
        public DateTime PolicyEndDate { get; set; }
        public decimal InsuredDeclaredValue { get; set; }
    }

    public class GetPurchasePolicy : PurchasePolicy
    {
        public string CustomerPolicyID { get; set; }
        public bool Status { get; set; }
        public string DocumentName { get; set; }
        public string DocumentPath { get; set; }

    }

    public class AddPurchasePolicy
    {
        public string vehicleChesisNo { get; set; }
        public DateTime policyStartDate { get; set; }
        public DateTime policyEndDate { get; set; }
        public decimal insuredDeclaredValue { get; set; }
        public long policyID { get; set; }
    }
}
