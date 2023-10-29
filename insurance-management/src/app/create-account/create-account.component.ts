import { Component, Inject, OnInit } from '@angular/core';
import { CreateAccountService } from './create-account.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Persondetail, UpdatePersondetail } from './personDetail';
import { DatePipe } from '@angular/common';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-create-account',
  templateUrl: './create-account.component.html',
  styleUrls: ['./create-account.component.scss'],
})
export class CreateAccountComponent implements OnInit {
  createAccountForm!: FormGroup;
  createAddressForm!: FormGroup;
  buttonText: string = 'Add';
  name!: string;
  isLinear = true;

  constructor(
    private accountService: CreateAccountService,
    private formBuilder: FormBuilder,
    private accountDialog: MatDialogRef<CreateAccountComponent>,
    private datePipe: DatePipe,
    @Inject(MAT_DIALOG_DATA) public editData: any
  ) {}

  ngOnInit(): void {
    const userJson = localStorage.getItem('isCustomer');

    this.name =
      userJson === null || userJson == 'true' ? 'Customer' : 'Employee';

    this.createAccountForm = this.formBuilder.group({
      userName: ['', [Validators.required]],
      password: [''],
      emailId: ['', Validators.required],
      dateOfBirth: ['', Validators.required],
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
    });

    this.createAddressForm = this.formBuilder.group({
      houseNo: ['', [Validators.required]],
      area: ['', Validators.required],
      city: ['', Validators.required],
      zip: ['', Validators.required],
      phoneNo: ['', [Validators.required]],
    });

    if (this.editData) {
      this.buttonText = 'Update';
      this.createAccountForm.controls['userName'].setValue(
        this.editData.userName
      );
      this.createAccountForm.controls['password'].setValue(
        this.editData.password
      );
      this.createAccountForm.controls['emailId'].setValue(
        this.editData.emailId
      );
      this.createAccountForm.controls['dateOfBirth'].setValue(
        this.editData.dateOfBirth
      );
      this.createAccountForm.controls['firstName'].setValue(
        this.editData.firstName
      );
      this.createAccountForm.controls['lastName'].setValue(
        this.editData.lastName
      );
      this.createAddressForm.controls['houseNo'].setValue(
        this.editData.houseNo
      );
      this.createAddressForm.controls['area'].setValue(this.editData.area);
      this.createAddressForm.controls['city'].setValue(this.editData.city);
      this.createAddressForm.controls['zip'].setValue(this.editData.zip);
      this.createAddressForm.controls['phoneNo'].setValue(
        this.editData.phoneNo
      );
    }
  }

  addUpdateEmployee() {
    if (this.editData) {
      this.updatePerson();
    } else {
      this.addPerson();
    }
  }

  addPerson() {
    var type = this.name === 'Customer' ? true : false;

    var personData: Persondetail = {
      userName: this.createAccountForm.value.userName,
      password: this.createAccountForm.value.password,
      emailId: this.createAccountForm.value.emailId,
      isActive: true,
      dateOfBirth: this.datePipe
        .transform(this.createAccountForm.value.dateOfBirth, 'yyyy-MM-dd')
        ?.toString(),
      firstName: this.createAccountForm.value.firstName,
      lastName: this.createAccountForm.value.lastName,
      phoneNo: this.createAddressForm.value.phoneNo,
      houseNo: this.createAddressForm.value.houseNo,
      area: this.createAddressForm.value.area,
      city: this.createAddressForm.value.city,
      zip: this.createAddressForm.value.zip,
      isCustomer: this.name === 'Customer' ? true : false,
    };

    this.accountService.addPerson(personData).subscribe({
      next: () => {
        this.createAccountForm.reset();
        this.createAddressForm.reset();
        this.accountDialog.close();
        alert(
          'Account Created Successfully. Please login using username and password.'
        );
      },
      error: () => {
        alert('Error while creating user.');
      },
    });
  }

  private updatePerson() {
    var modelData: UpdatePersondetail = {
      personId: this.editData.personId,
      userName: this.createAccountForm.value.userName,
      password:
        this.createAccountForm.value.password === undefined
          ? ''
          : this.createAccountForm.value.password,
      emailId: this.createAccountForm.value.emailId,
      isActive: true,
      dateOfBirth: this.datePipe
        .transform(this.createAccountForm.value.dateOfBirth, 'yyyy-MM-dd')
        ?.toString(),
      firstName: this.createAccountForm.value.firstName,
      lastName: this.createAccountForm.value.lastName,
      phoneNo: this.createAddressForm.value.phoneNo,
      houseNo: this.createAddressForm.value.houseNo,
      area: this.createAddressForm.value.area,
      city: this.createAddressForm.value.city,
      zip: this.createAddressForm.value.zip,
      isCustomer: this.name === 'Customer' ? true : false,
    };
    this.accountService
      .updatePerson(this.editData.personId, modelData)
      .subscribe({
        next: () => {
          this.createAccountForm.reset();
          this.accountDialog.close();
          alert('Account Updated Successfully.');
        },
        error: () => {
          alert('Error while Updating Account.');
        },
      });
  }
}
