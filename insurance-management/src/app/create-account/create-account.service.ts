import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ApiPaths, environment } from 'src/environments/environment';
import { Persondetail, UpdatePersondetail } from './personDetail';

@Injectable({
  providedIn: 'root',
})
export class CreateAccountService {
  private headers = { 'content-type': 'application/json' };

  constructor(private http: HttpClient) {}

  addPerson(persondetail: Persondetail): any {
    return this.http.post(
      environment.baseUrl + ApiPaths.Person,
      JSON.stringify(persondetail),
      { headers: this.headers }
    );
  }

  updatePerson(itemId: string, menuItem: UpdatePersondetail): any {
    return this.http.put(
      environment.baseUrl + ApiPaths.Person + '/' + itemId,
      JSON.stringify(menuItem),
      { headers: this.headers }
    );
  }

  getAllEmployees() {
    return this.http.get<any>(
      environment.baseUrl + ApiPaths.Person + '/GetEmployees'
    );
  }

  makePersonInactive(personId: any, isCustomer: boolean) {
    return this.http.delete(
      environment.baseUrl + ApiPaths.Person + '/' + personId + '/' + isCustomer
    );
  }
}
