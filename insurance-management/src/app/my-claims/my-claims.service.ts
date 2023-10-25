import { AddClaim } from './myClaimsDTO';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ApiPaths, environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class MyClaimsService {
  private headers = { 'content-type': 'application/json' };

  constructor(private http: HttpClient) {}

  getAllClaims(person: string): any {
    return this.http.get<any>(
      environment.baseUrl + ApiPaths.MyClaims + '/' + person
    );
  }

  addNewClaim(person: string, newClaim: AddClaim): any {
    return this.http.post(
      environment.baseUrl + ApiPaths.MyClaims + '/' + person,
      JSON.stringify(newClaim),
      { headers: this.headers }
    );
  }
}
