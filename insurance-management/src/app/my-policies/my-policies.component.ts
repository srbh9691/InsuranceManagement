import { Component, OnInit, ViewChild } from '@angular/core';
import { MyPoliciesService } from './my-policies.service';
import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { MatSort } from '@angular/material/sort';
import { MatPaginator } from '@angular/material/paginator';
import { GetMyPolicyDTO } from './myPoliciesDTO';
import { MyPolicyDialogComponent } from './my-policies-dialog/my-policies-dialog.component';

@Component({
  selector: 'app-my-policies',
  templateUrl: './my-policies.component.html',
  styleUrls: ['./my-policies.component.scss'],
})
export class MyPoliciesComponent implements OnInit {
  constructor(
    private myPoliciesService: MyPoliciesService,
    public dialog: MatDialog
  ) {
    this.getMyPolicies();
  }

  displayedColumns: string[] = [
    'VehicleChesisNo',
    'CustomerPolicyID',
    'PolicyStartDate',
    'PolicyEndDate',
    'InsuredDeclaredValue',
    'Status',
  ];

  dataSource!: MatTableDataSource<GetMyPolicyDTO>;
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  personId!: any;

  ngOnInit(): void {
    this.personId = localStorage.getItem('personId');
    this.getMyPolicies();
  }

  getMyPolicies() {
    this.myPoliciesService.getAllPurchasedPolicies(this.personId).subscribe({
      next: (res: GetMyPolicyDTO[] | undefined) => {
        this.dataSource = new MatTableDataSource(res);
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      },
      error: () => {
        alert('Error while reading policies!');
      },
    });
  }

  purchasePolicy() {
    const dialogRef = this.dialog.open(MyPolicyDialogComponent, {
      width: '25%',
    });
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }
}
