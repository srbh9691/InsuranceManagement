namespace InsuranceManagementAPI.Data
{
    public class PurchasePolicy
    {
        public string VehicleChesisNo { get; set;}
        public DateTime PolicyStartDate { get; set;}
        public DateTime PolicyEndDate { get; set; }
        public decimal InsuredDeclaredValue { get; set; }
        public string Status { get; set; }
    }

    public class GetPurchasePolicy : PurchasePolicy
    {
        public string CustomerPolicyID { get; set; }
    }

    public class AddPurchasePolicy : PurchasePolicy
    {
        public long PolicyID { get; set; }
    }
}
