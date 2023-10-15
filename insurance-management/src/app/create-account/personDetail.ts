export interface Persondetail {
  firstName: string;
  lastName: string;
  phoneNo: string;
  userName: string;
  password: string;
  isActive: boolean;
  emailId: string;
  dateOfBirth?: string;
  houseNo: string;
  area: string;
  city: string;
  zip: number;
}
export interface UpdatePersondetail {
  personId: string;
  firstName: string;
  lastName: string;
  phoneNo: string;
  userName: string;
  password: string;
  isActive: boolean;
  emailId: string;
  dateOfBirth?: string;
  houseNo: string;
  area: string;
  city: string;
  zip: number;
  isCustomer: boolean;
}
