import { Component, OnInit, ViewChild } from '@angular/core';
import { MyClaimsService } from './my-claims.service';
import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { MatSort } from '@angular/material/sort';
import { MatPaginator } from '@angular/material/paginator';
import { GetClaim } from './myClaimsDTO';
import { MyClaimsDialogComponent } from './my-claims-dialog/my-claims-dialog.component';

@Component({
  selector: 'app-my-claims',
  templateUrl: './my-claims.component.html',
  styleUrls: ['./my-claims.component.scss'],
})
export class MyClaimsComponent implements OnInit {
  constructor(
    private myClaimsService: MyClaimsService,
    public dialog: MatDialog
  ) {
    this.personId = localStorage.getItem('personId');
    this.getMyClaims();
  }

  displayedColumns: string[] = [
    'ClaimID',
    'CustomerPolicyID',
    'ClaimType',
    'ClaimAmount',
    'SettlementStatus',
    'ApprovedBy',
    'ApprovedAmount',
  ];

  dataSource!: MatTableDataSource<GetClaim>;
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  personId!: any;

  ngOnInit(): void {
    this.getMyClaims();
  }

  getMyClaims() {
    this.myClaimsService.getAllClaims(this.personId).subscribe({
      next: (res: GetClaim[] | undefined) => {
        this.dataSource = new MatTableDataSource(res);
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      },
      error: () => {
        alert('Error while reading claims!');
      },
    });
  }

  addClaim() {
    const dialogRef = this.dialog.open(MyClaimsDialogComponent, {
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
