export interface GetMyPolicyDTO {
  vehicleChesisNo: string;
  customerPolicyID: string;
  policyStartDate: Date;
  policyEndDate: Date;
  insuredDeclaredValue: number;
  status: string;
}

export interface AddMyPolicyDTO {
  vehicleChesisNo: string;
  policyID: number;
  policyStartDate: Date;
  policyEndDate: Date;
  insuredDeclaredValue: number;
  status: string;
}
