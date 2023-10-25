import { Component, OnInit, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { MatSort } from '@angular/material/sort';
import { MatPaginator } from '@angular/material/paginator';
import { MatDialog } from '@angular/material/dialog';
import { VehicleService } from './vehicle.service';
import { VehicleDTO } from './vehicleDTO';
import { VehicleDialogComponent } from './vehicle-dialog/vehicle-dialog.component';

@Component({
  selector: 'app-policy',
  templateUrl: './vehicle.component.html',
  styleUrls: ['./vehicle.component.scss'],
})
export class VehicleComponent implements OnInit {
  constructor(
    private vehicleService: VehicleService,
    public dialog: MatDialog
  ) {
    this.personId = localStorage.getItem('personId');
    this.getAllVehicles();
  }

  displayedColumns: string[] = [
    'VehicleChesisNo',
    'RegistrationNumber',
    'TypeOfVehicle',
    'Make',
    'Model',
    'PurchaseDate',
    'action',
  ];

  dataSource!: MatTableDataSource<VehicleDTO>;
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  personId!: any;

  ngOnInit(): void {
    this.getAllVehicles();
  }

  getAllVehicles() {
    this.vehicleService.getAllVehicles(this.personId).subscribe({
      next: (res: VehicleDTO[] | undefined) => {
        this.dataSource = new MatTableDataSource(res);
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      },
      error: () => {
        alert('Error while reading policies!');
      },
    });
  }

  addVehicleDialog() {
    const dialogRef = this.dialog.open(VehicleDialogComponent, {
      width: '25%',
    });
  }

  updateVehicleDialog(row: any) {
    const dialogRef = this.dialog.open(VehicleDialogComponent, {
      width: '25%',
      data: row,
    });
  }

  deleteVehicle(row: any) {
    if (
      confirm(
        'Are you sure you want to delete vehicle having chesis no ' +
          row.vehicleChesisNo +
          ' ?'
      )
    ) {
      this.vehicleService.deletePolicy(row.policyID).subscribe({
        next: () => {
          alert('Vehicle deleted!');
          this.getAllVehicles();
        },
        error: (err: any) => {
          alert('Error while deleting vehicle!');
        },
      });
    }
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }
}
