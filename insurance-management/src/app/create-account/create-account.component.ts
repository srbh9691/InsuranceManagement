import { Component, OnInit } from '@angular/core';
import { CreateAccountService } from './create-account.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Persondetail } from './personDetail';
import { Router } from '@angular/router';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-create-account',
  templateUrl: './create-account.component.html',
  styleUrls: ['./create-account.component.scss'],
})
export class CreateAccountComponent implements OnInit {
  createAcccountForm!: FormGroup;
  hide = true;

  constructor(
    private createAccountService: CreateAccountService,
    private formBuilder: FormBuilder,
    private router: Router,
    private datePipe: DatePipe
  ) {}

  ngOnInit(): void {
    this.createAcccountForm = this.formBuilder.group({
      userName: ['', [Validators.required]],
      password: ['', Validators.required],
      emailId: ['', Validators.required],
      dateOfBirth: ['', Validators.required],
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      phoneNo: ['', [Validators.required, Validators.minLength(10), Validators.maxLength(10)]],
    });
  }

  createAccount() {
    var personData: Persondetail = {
      userName: this.createAcccountForm.value.userName,
      password: this.createAcccountForm.value.password,
      emailId: this.createAcccountForm.value.emailId,
      dateOfBirth: this.datePipe.transform(this.createAcccountForm.value.dateOfBirth, "yyyy-MM-dd")?.toString(),
      firstName: this.createAcccountForm.value.firstName,
      lastName: this.createAcccountForm.value.lastName,
      phoneNo: this.createAcccountForm.value.phoneNo,
      houseNo: "1",
      area: "1",
      city: " 1",
      zip: 1
    };

    this.createAccountService.addPerson(personData).subscribe({
      next: () => {
        alert('Account Created Successfully. Please login using username and password.');
        this.router.navigate(['/menu']);
      },
      error: () => {
        alert('Error while creating user.');
      },
    });
  }
}
