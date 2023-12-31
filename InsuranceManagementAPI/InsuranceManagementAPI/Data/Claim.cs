﻿namespace InsuranceManagementAPI.Data
{
    public class Claim
    {
        public string CustomerPolicyID { get; set; }
        public string ClaimType { get; set; }
        public decimal ClaimAmount { get; set; }
        public string DamageDetails { get; set; }
        public string IFSCCode { get; set; }
        public long AccountNo { get; set; }
        public string AccountHolderName { get; set; }
    }

    public class GetClaim : Claim
    {
        public string ClaimID { get; set; }
        public string ApprovedBy { get; set; }
        public bool SettlementStatus { get; set; }
        public decimal ApprovedAmount { get; set; }
        public DateTime ClaimIntimationDate { get; set; }
        public string DocumentName { get; set; }
    }

    public class ApproveClaim
    {
        public string ClaimID { get; set; }
        public decimal ApprovedAmount { get; set; }
    }
}
