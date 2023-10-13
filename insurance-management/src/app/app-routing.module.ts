import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { TemplateComponent } from './template/template.component';
import { AuthGuard } from './shared/authguard.guard';
import { PolicyComponent } from './policy/policy.component';
import { CreateAccountComponent } from './create-account/create-account.component';
import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: '', component: LoginComponent },
  { path: 'create-account', component: CreateAccountComponent },
  { path: 'forgot-password', component: ForgotPasswordComponent },
  {
    path: '',
    component: TemplateComponent,
    children: [
      { path: 'policy', component: PolicyComponent },
        ],
  },
  { path: '**', redirectTo: 'login' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
