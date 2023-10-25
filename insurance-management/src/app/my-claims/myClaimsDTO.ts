export interface GetClaim {
  customerPolicyID: string;
  claimType: string;
  claimAmount: number;
  claimID: string;
  approvedBy: string;
  settlementStatus: boolean;
  approvedAmount: number;
}

export interface AddClaim {
  customerPolicyID: string;
  claimType: string;
  claimAmount: number;
  damageDetails: string;
  ifscCode: string;
  accountNo: number;
  accountHolderName: string;
}
