import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AddMyPolicyDTO } from '../myPoliciesDTO';
import { MyPoliciesService } from '../my-policies.service';
import { MatDialogRef } from '@angular/material/dialog';
import { PolicyDTO } from 'src/app/policy/policyDTO';
import { PolicyService } from 'src/app/policy/policy.service';
import { VehicleService } from 'src/app/vehicle/vehicle.service';
import { VehicleDTO } from 'src/app/vehicle/vehicleDTO';

@Component({
  selector: 'app-user-dialog',
  templateUrl: './my-policies-dialog.component.html',
  styleUrls: ['./my-policies-dialog.component.scss'],
})
export class MyPolicyDialogComponent implements OnInit {
  hide = true;
  purchasePolicyForm!: FormGroup;
  newUserData!: AddMyPolicyDTO;
  buttonText: string = 'Add';
  policyData: PolicyDTO[] = [];
  vehicleData: VehicleDTO[] = [];
  personId!: any;

  constructor(
    private formBuilder: FormBuilder,
    private purchasePolicyService: MyPoliciesService,
    private policyService: PolicyService,
    private vehicleService: VehicleService,
    private myPolicyDialogComponent: MatDialogRef<MyPolicyDialogComponent>
  ) {
    this.personId = localStorage.getItem('personId');
  }

  ngOnInit(): void {
    this.getAllPolicies();
    this.getAllVehicleChesisNo();
    this.purchasePolicyForm = this.formBuilder.group({
      vehicleChesisNo: ['', Validators.required],
      policyID: ['', Validators.required],
      policyStartDate: ['', Validators.required],
      policyEndDate: ['', Validators.required],
      insuredDeclaredValue: ['', Validators.required],
    });
  }

  purchaseNewPolicy() {
    var puchasePolicy: AddMyPolicyDTO = {
      vehicleChesisNo: this.purchasePolicyForm.value.vehicleChesisNo,
      policyID: this.purchasePolicyForm.value.policyID,
      policyStartDate: this.purchasePolicyForm.value.policyStartDate,
      policyEndDate: this.purchasePolicyForm.value.policyEndDate,
      insuredDeclaredValue: this.purchasePolicyForm.value.insuredDeclaredValue,
    };

    this.purchasePolicyService
      .purchaseNewPolicy(this.personId, puchasePolicy)
      .subscribe({
        next: () => {
          this.purchasePolicyForm.reset();
          this.myPolicyDialogComponent.close();
          alert('Policy purchased Successfully.');
        },
        error: () => {
          alert('Error while purchasing Policy.');
        },
      });
  }

  getAllPolicies() {
    this.policyService.getAllPolicies().subscribe({
      next: (res: PolicyDTO[]) => {
        this.policyData = res;
      },
      error: () => {
        alert('Error while reading policies!');
      },
    });
  }

  getAllVehicleChesisNo() {
    this.vehicleService.getAllVehicles(this.personId).subscribe({
      next: (res: VehicleDTO[]) => {
        this.vehicleData = res;
      },
      error: () => {
        alert('Error while reading policies!');
      },
    });
  }
}
