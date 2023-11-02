import { AddClaim, ApproveClaim } from './myClaimsDTO';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ApiPaths, environment } from 'src/environments/environment';
import { AuthService } from '../shared/auth.service';

@Injectable({
  providedIn: 'root',
})
export class MyClaimsService {
  private headers = { 'content-type': 'application/json' };

  constructor(private http: HttpClient, private authService: AuthService) {}

  getAllClaims(person: string): any {
    if (this.authService.IsEmployee()) {
      person = '0';
    }

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

  approveClaim(person: string, approveClaim: ApproveClaim) {
    return this.http.put(
      environment.baseUrl + ApiPaths.MyClaims + '/' + person,
      JSON.stringify(approveClaim),
      { headers: this.headers }
    );
  }

  uploadDocument(claimId: string, file: any, fileName: string) {
    let fileData = new FormData();
    fileData.set('file', file);
    fileData.set('fileName', fileName);
    fileData.set('claimId', claimId);
    return this.http.post(environment.baseUrl + ApiPaths.MyClaims, fileData);
  }

  downloadDocument(claimId: string, documentName: string): any {
    return this.http.get(
      environment.baseUrl +
        ApiPaths.MyClaims +
        '/' +
        claimId +
        '/' +
        documentName,
      { observe: 'response', responseType: 'blob' }
    );
  }
}
