import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ForgotPasswordService } from './forgot-password.service';
import { Router } from '@angular/router';

@Component({
  selector: 'forgot-password',
  templateUrl: './forgot-password.component.html',
  styleUrls: ['./forgot-password.component.scss']
})
export class ForgotPasswordComponent implements OnInit {
  forgotPasswordForm!:FormGroup
  emailId = ""

  constructor(
    private forgotPasswordService: ForgotPasswordService,
    private formBuilder: FormBuilder,
    private router: Router,
  ){}

  ngOnInit(): void {
    this.forgotPasswordForm = this.formBuilder.group({
      emailId: ['', [Validators.required]],
    });
  }

  forgotPassword(){
console.log("Email is " +this.emailId)

    this.forgotPasswordService.forgotPassword(this.emailId).subscribe({
      next: () => {
        alert('Password Sent Successfully. Please login using username and password.');
        this.router.navigate(['/login']);
      },
      error: () => {
        alert('Error while creating user.');
      },
    });

  }
}
