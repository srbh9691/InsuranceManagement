export interface GetClaim {
  customerPolicyID: string;
  claimType: string;
  claimAmount: number;
  damageDetails: string;
  claimID: string;
  approvedBy: string;
  settlementStatus: boolean;
  approvedAmount: number;
  claimIntimationDate: Date;
  ifscCode: string;
  accountNo: number;
  accountHolderName: string;
  documentName: string;
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

export interface ApproveClaim {
  claimID: string;
  approvedAmount: number;
}
