import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ApiPaths, environment } from 'src/environments/environment';
import { AddMyPolicyDTO } from './myPoliciesDTO';
import { AuthService } from '../shared/auth.service';

@Injectable({
  providedIn: 'root',
})
export class MyPoliciesService {
  private headers = { 'content-type': 'application/json' };

  constructor(private http: HttpClient, private authService: AuthService) {}

  getAllPurchasedPolicies(person: string): any {
    if (this.authService.IsEmployee()) {
      person = '0';
    }
    return this.http.get<any>(
      environment.baseUrl + ApiPaths.PurchasePolicy + '/' + person
    );
  }

  purchaseNewPolicy(person: string, newPolicy: AddMyPolicyDTO): any {
    return this.http.post(
      environment.baseUrl + ApiPaths.PurchasePolicy + '/' + person,
      JSON.stringify(newPolicy),
      { headers: this.headers }
    );
  }
}
