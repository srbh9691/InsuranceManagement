import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { ApiPaths } from 'src/environments/environment';
import { PolicyDTO } from './policyDTO';

@Injectable({
  providedIn: 'root',
})
export class PolicyService {
  private headers = { 'content-type': 'application/json' };

  constructor(private http: HttpClient) {}

  getAllPolicies(): any {
    return this.http.get<any>(environment.baseUrl + ApiPaths.Policy);
  }

  addUpdatePolicy(newPolicy: PolicyDTO): any {
    return this.http.post(
      environment.baseUrl + ApiPaths.Policy,
      JSON.stringify(newPolicy),
      { headers: this.headers }
    );
  }

  deletePolicy(policyID: string): any {
    return this.http.delete(
      environment.baseUrl + ApiPaths.Policy + '/' + policyID
    );
  }
}
