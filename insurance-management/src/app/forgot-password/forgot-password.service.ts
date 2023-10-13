import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import {
  ApiPaths,
  environment,
} from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class ForgotPasswordService {
  private headers = { 'content-type': 'application/json' };

  constructor(private http: HttpClient) {}

  forgotPassword(emailId : string): any {

    return this.http.post(
      environment.baseUrl + ApiPaths.ResetPassword + '?emailId=' + emailId,
      { headers: this.headers }
    );
  }
}
