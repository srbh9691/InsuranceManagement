import { Component, Inject, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { PolicyDTO } from '../policyDTO';
import { PolicyService } from '../policy.service';

@Component({
  selector: 'app-user-dialog',
  templateUrl: './policy-dialog.component.html',
  styleUrls: ['./policy-dialog.component.scss'],
})
export class PolicyDialogComponent implements OnInit {
  hide = true;
  policyForm!: FormGroup;
  newUserData!: PolicyDTO;
  buttonText: string = 'Add';
  policyID: number = 0;

  constructor(
    private formBuilder: FormBuilder,
    private policyService: PolicyService,
    private policyDialog: MatDialogRef<PolicyDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public editData: any
  ) {}

  ngOnInit(): void {
    this.policyForm = this.formBuilder.group({
      policyID: [''],
      name: ['', Validators.required],
      typeOfPolicy: ['', Validators.required],
      premium: ['', Validators.required],
    });

    if (this.editData) {
      this.buttonText = 'Update';
      this.policyForm.controls['policyID'].setValue(this.editData.policyID);
      this.policyForm.controls['name'].setValue(this.editData.name);
      this.policyForm.controls['typeOfPolicy'].setValue(
        this.editData.typeOfPolicy
      );
      this.policyForm.controls['premium'].setValue(this.editData.premium);
    }
  }

  addPolicy() {
    if (this.editData) {
      this.policyID = this.policyForm.value.policyID;
    }

    var policyData: PolicyDTO = {
      name: this.policyForm.value.name,
      typeOfPolicy: this.policyForm.value.typeOfPolicy,
      premium: this.policyForm.value.premium,
      policyID: this.policyID,
    };

    this.policyService.addUpdatePolicy(policyData).subscribe({
      next: () => {
        this.policyForm.reset();
        this.policyDialog.close();
        if (this.editData) {
          alert('Policy Updated Successfully.');
        } else {
          alert('Policy Added Successfully.');
        }
      },
      error: () => {
        alert('Error while adding Policy.');
      },
    });
  }
}
