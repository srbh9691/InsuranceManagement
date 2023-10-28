import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ApproveClaim } from '../myClaimsDTO';
import { MyClaimsService } from '../my-claims.service';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-user-dialog',
  templateUrl: './approve-claim-dialog.component.html',
  styleUrls: ['./approve-claim-dialog.component.scss'],
})
export class ApproveClaimDialogComponent implements OnInit {
  approveClaimForm!: FormGroup;
  personId!: any;
  personName!: any;
  isDisabled: boolean = true;

  constructor(
    private formBuilder: FormBuilder,
    private myClaimService: MyClaimsService,
    private approveClaimDialogComponent: MatDialogRef<ApproveClaimDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public editData: any
  ) {
    this.personId = localStorage.getItem('personId');
    this.personName = localStorage.getItem('currentUser');
  }

  ngOnInit(): void {
    this.approveClaimForm = this.formBuilder.group({
      claimID: ['', Validators.required],
      approvedBy: ['', Validators.required],
      claimAmount: ['', Validators.required],
      approvedAmount: ['', Validators.required],
    });

    if (this.editData) {
      this.approveClaimForm.controls['claimID'].setValue(this.editData.claimID);
      this.approveClaimForm.controls['approvedBy'].setValue(this.personName);
      this.approveClaimForm.controls['claimAmount'].setValue(
        this.editData.claimAmount
      );
    }
  }

  approveClaim() {
    var approveClaim: ApproveClaim = {
      claimID: this.approveClaimForm.value.claimID,
      approvedAmount: this.approveClaimForm.value.approvedAmount,
    };

    this.myClaimService.approveClaim(this.personId, approveClaim).subscribe({
      next: () => {
        this.approveClaimForm.reset();
        this.approveClaimDialogComponent.close();
        alert('Claim approved Successfully.');
      },
      error: () => {
        alert('Error while approving Claim.');
      },
    });
  }
}
