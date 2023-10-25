import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NoopAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { MatCardModule } from '@angular/material/card';
import { MatDividerModule } from '@angular/material/divider';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { LoginComponent } from './login/login.component';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { TokenInterceptor } from './token.interceptor';
import { TemplateComponent } from './template/template.component';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatListModule } from '@angular/material/list';
import { PolicyComponent } from './policy/policy.component';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { PolicyDialogComponent } from './policy/policy-dialog/policy-dialog.component';
import { MatDialogModule } from '@angular/material/dialog';
import { CreateAccountComponent } from './create-account/create-account.component';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { DatePipe } from '@angular/common';
import { MatNativeDateModule } from '@angular/material/core';
import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';
import { EmployeeComponent } from './create-account/employee/employee.component';
import { MatStepperModule } from '@angular/material/stepper';
import { VehicleComponent } from './vehicle/vehicle.component';
import { VehicleDialogComponent } from './vehicle/vehicle-dialog/vehicle-dialog.component';
import { MyPoliciesComponent } from './my-policies/my-policies.component';
import { MyPolicyDialogComponent } from './my-policies/my-policies-dialog/my-policies-dialog.component';
import { MatOptionModule } from '@angular/material/core';
import { MatSelectModule } from '@angular/material/select';
import { MyClaimsComponent } from './my-claims/my-claims.component';
import { MyClaimsDialogComponent } from './my-claims/my-claims-dialog/my-claims-dialog.component';

const MaterialComponents = [
  BrowserModule,
  AppRoutingModule,
  NoopAnimationsModule,
  HttpClientModule,
  MatCardModule,
  MatDividerModule,
  FormsModule,
  ReactiveFormsModule,
  MatIconModule,
  MatButtonModule,
  MatFormFieldModule,
  MatInputModule,
  MatToolbarModule,
  MatSidenavModule,
  MatListModule,
  MatTableModule,
  MatPaginatorModule,
  MatDialogModule,
  MatDatepickerModule,
  MatNativeDateModule,
  MatStepperModule,
  MatOptionModule,
  MatSelectModule,
];

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    TemplateComponent,
    PolicyComponent,
    PolicyDialogComponent,
    CreateAccountComponent,
    ForgotPasswordComponent,
    EmployeeComponent,
    VehicleComponent,
    VehicleDialogComponent,
    MyPoliciesComponent,
    MyPolicyDialogComponent,
    MyClaimsComponent,
    MyClaimsDialogComponent,
  ],
  imports: [MaterialComponents],
  providers: [
    DatePipe,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: TokenInterceptor,
      multi: true,
    },
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
