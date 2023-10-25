import { Component, Inject, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { VehicleDTO } from '../vehicleDTO';
import { VehicleService } from '../vehicle.service';

@Component({
  selector: 'app-user-dialog',
  templateUrl: './vehicle-dialog.component.html',
  styleUrls: ['./vehicle-dialog.component.scss'],
})
export class VehicleDialogComponent implements OnInit {
  hide = true;
  vehicleForm!: FormGroup;
  newUserData!: VehicleDTO;
  buttonText: string = 'Add';
  personId!: any;

  constructor(
    private formBuilder: FormBuilder,
    private vehicleService: VehicleService,
    private vehicleDialog: MatDialogRef<VehicleDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public editData: any
  ) {
    this.personId = localStorage.getItem('personId');
  }

  ngOnInit(): void {
    this.vehicleForm = this.formBuilder.group({
      vehicleChesisNo: ['', Validators.required],
      registrationNumber: ['', Validators.required],
      typeOfVehicle: ['', Validators.required],
      make: ['', Validators.required],
      model: ['', Validators.required],
      purchaseDate: ['', Validators.required],
    });

    if (this.editData) {
      this.buttonText = 'Update';
      this.vehicleForm.controls['vehicleChesisNo'].setValue(
        this.editData.vehicleChesisNo
      );
      this.vehicleForm.controls['registrationNumber'].setValue(
        this.editData.registrationNumber
      );
      this.vehicleForm.controls['typeOfVehicle'].setValue(
        this.editData.typeOfVehicle
      );
      this.vehicleForm.controls['make'].setValue(this.editData.make);
      this.vehicleForm.controls['model'].setValue(this.editData.model);
      this.vehicleForm.controls['purchaseDate'].setValue(
        this.editData.purchaseDate
      );
    }
  }

  addUpdateVehicle() {
    var vehicleData: VehicleDTO = {
      vehicleChesisNo: this.vehicleForm.value.vehicleChesisNo,
      registrationNumber: this.vehicleForm.value.registrationNumber,
      typeOfVehicle: this.vehicleForm.value.typeOfVehicle,
      make: this.vehicleForm.value.make,
      model: this.vehicleForm.value.model,
      purchaseDate: this.vehicleForm.value.purchaseDate,
    };

    if (this.editData) {
      this.vehicleService.updateVehicle(vehicleData).subscribe({
        next: () => {
          this.vehicleForm.reset();
          this.vehicleDialog.close();
          alert('Vehicle Updated Successfully.');
        },
        error: () => {
          alert('Error while adding Policy.');
        },
      });
    } else {
      this.vehicleService.addVehicle(this.personId, vehicleData).subscribe({
        next: () => {
          this.vehicleForm.reset();
          this.vehicleDialog.close();
          alert('Vehicle Added Successfully.');
        },
        error: () => {
          alert('Error while adding Policy.');
        },
      });
    }
  }
}
