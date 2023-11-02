import { AuthService } from './../shared/auth.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { PolicyService } from './policy.service';
import { PolicyDTO } from './policyDTO';
import { MatTableDataSource } from '@angular/material/table';
import { MatSort } from '@angular/material/sort';
import { MatPaginator } from '@angular/material/paginator';
import { MatDialog } from '@angular/material/dialog';
import { PolicyDialogComponent } from './policy-dialog/policy-dialog.component';

@Component({
  selector: 'app-policy',
  templateUrl: './policy.component.html',
  styleUrls: ['./policy.component.scss'],
})
export class PolicyComponent implements OnInit {
  constructor(
    private policyService: PolicyService,
    public dialog: MatDialog,
    private authService: AuthService
  ) {}

  displayedColumns: string[] = [
    'PolicyID',
    'PolicyName',
    'TypeOFPolicy',
    'Premium',
  ];

  dataSource!: MatTableDataSource<PolicyDTO>;
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  isEmployee!: boolean;

  ngOnInit(): void {
    this.getAllPolicies();
    this.isEmployee = this.authService.IsEmployee();
    if (this.isEmployee) {
      this.displayedColumns.push('action');
    }
  }

  getAllPolicies() {
    this.policyService.getAllPolicies().subscribe({
      next: (res: PolicyDTO[] | undefined) => {
        this.dataSource = new MatTableDataSource(res);
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      },
      error: () => {
        alert('Error while reading policies!');
      },
    });
  }

  addPolicyDialog() {
    const dialogRef = this.dialog.open(PolicyDialogComponent, {
      width: '25%',
    });
    dialogRef.afterClosed().subscribe((data) => {
      this.getAllPolicies();
    });
  }

  updatePolicyDialog(row: any) {
    const dialogRef = this.dialog.open(PolicyDialogComponent, {
      width: '25%',
      data: row,
    });
    dialogRef.afterClosed().subscribe((data) => {
      this.getAllPolicies();
    });
  }

  deletePolicy(row: any) {
    if (
      confirm(
        'Are you sure you want to delete Polocy ID ' + row.policyID + ' ?'
      )
    ) {
      this.policyService.deletePolicy(row.policyID).subscribe({
        next: () => {
          alert('Policy deleted!');
          this.getAllPolicies();
        },
        error: (err: any) => {
          alert('Error while deleting policy!');
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
