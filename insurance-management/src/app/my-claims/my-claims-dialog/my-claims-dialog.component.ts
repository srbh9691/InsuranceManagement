import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { AddClaim } from '../myClaimsDTO';
import { MyClaimsService } from '../my-claims.service';
import { MyPoliciesService } from 'src/app/my-policies/my-policies.service';
import { GetMyPolicyDTO } from 'src/app/my-policies/myPoliciesDTO';

interface DropDownItem {
  value: string;
  viewValue: string;
}

@Component({
  selector: 'app-user-dialog',
  templateUrl: './my-claims-dialog.component.html',
  styleUrls: ['./my-claims-dialog.component.scss'],
})
export class MyClaimsDialogComponent implements OnInit {
  hide = true;
  addClaimForm!: FormGroup;
  newUserData!: AddClaim;
  buttonText: string = 'Add';
  personId!: any;
  purchasedPolicies: GetMyPolicyDTO[] = [];

  constructor(
    private formBuilder: FormBuilder,
    private myClaimService: MyClaimsService,
    private myPoliciesService: MyPoliciesService,
    private addClaimDialogComponent: MatDialogRef<MyClaimsDialogComponent>
  ) {
    this.personId = localStorage.getItem('personId');
    this.getPurchasePolicies();
  }

  ngOnInit(): void {
    this.addClaimForm = this.formBuilder.group({
      customerPolicyID: ['', Validators.required],
      claimType: ['', Validators.required],
      claimAmount: ['', Validators.required],
      damageDetails: ['', Validators.required],
      ifscCode: ['', Validators.required],
      accountNo: ['', Validators.required],
      accountHolderName: ['', Validators.required],
    });
  }

  purchaseNewPolicy() {
    var addClaim: AddClaim = {
      customerPolicyID: this.addClaimForm.value.customerPolicyID,
      claimType: this.addClaimForm.value.claimType,
      claimAmount: this.addClaimForm.value.claimAmount,
      damageDetails: this.addClaimForm.value.damageDetails,
      ifscCode: this.addClaimForm.value.ifscCode,
      accountNo: this.addClaimForm.value.accountNo,
      accountHolderName: this.addClaimForm.value.accountHolderName,
    };

    this.myClaimService.addNewClaim(this.personId, addClaim).subscribe({
      next: () => {
        this.addClaimForm.reset();
        this.addClaimDialogComponent.close();
        alert('Claim Added Successfully.');
      },
      error: () => {
        alert('Error while adding Claim.');
      },
    });
  }

  getPurchasePolicies() {
    this.myPoliciesService.getAllPurchasedPolicies(this.personId).subscribe({
      next: (res: GetMyPolicyDTO[]) => {
        this.purchasedPolicies = res;
      },
      error: () => {
        alert('Error while reading policies!');
      },
    });
  }

  vehicleTypes: DropDownItem[] = [
    { value: '2 Wheeler', viewValue: '2 Wheeler' },
    { value: '4 Wheeler', viewValue: '4 Wheeler' },
  ];
}
