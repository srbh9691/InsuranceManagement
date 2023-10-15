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
  buttonText: string = 'Add';
  name!: string;

  constructor(
    private accountService: CreateAccountService,
    private formBuilder: FormBuilder,
    private accountDialog: MatDialogRef<CreateAccountComponent>,
    private datePipe: DatePipe,
    @Inject(MAT_DIALOG_DATA) public editData: any
  ) {}

  ngOnInit(): void {
    const userJson = localStorage.getItem('isCustomer');

    console.log(userJson);
    this.name = userJson === null || userJson == 'true' ? 'Customer' : 'Employee';
    console.log(this.name);

    this.createAccountForm = this.formBuilder.group({
      userName: ['', [Validators.required]],
      password: ['', Validators.required],
      emailId: ['', Validators.required],
      dateOfBirth: ['', Validators.required],
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
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
      this.createAccountForm.controls['phoneNo'].setValue(
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
      phoneNo: this.createAccountForm.value.phoneNo,
      houseNo: '1',
      area: '1',
      city: ' 1',
      zip: 1,
    };

    this.accountService.addPerson(personData).subscribe({
      next: () => {
        this.createAccountForm.reset();
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
      phoneNo: this.createAccountForm.value.phoneNo,
      houseNo: '',
      area: '',
      city: '',
      zip: 0,
      isCustomer: true,
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
