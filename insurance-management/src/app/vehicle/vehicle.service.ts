import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { ApiPaths } from 'src/environments/environment';
import { VehicleDTO } from './vehicleDTO';

@Injectable({
  providedIn: 'root'
})
export class VehicleService {

  private headers = { 'content-type': 'application/json' };

  constructor(private http: HttpClient) { }

  getAllVehicles(person:string): any {
    console.log("in get")
    console.log(environment.baseUrl + ApiPaths.MyVehicles + "/" + person)
    return this.http.get<any>(environment.baseUrl + ApiPaths.MyVehicles + "/" + person);
  }

  addVehicle(person:string, newVehicle: VehicleDTO): any {
    return this.http.post(environment.baseUrl + ApiPaths.MyVehicles + "/" + person, JSON.stringify(newVehicle), { headers: this.headers });
  }

  updateVehicle(editVehicle: VehicleDTO): any {
    return this.http.put(environment.baseUrl + ApiPaths.MyVehicles, JSON.stringify(editVehicle), { headers: this.headers });
  }

  deletePolicy(vehicleChesisNo: string): any {
    return this.http.delete(environment.baseUrl + ApiPaths.MyVehicles + "/" + vehicleChesisNo);
  }
}
