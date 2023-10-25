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
  constructor(private policyService: PolicyService, public dialog: MatDialog) {
    this.getAllPolicies();
  }

  displayedColumns: string[] = [
    'PolicyID',
    'PolicyName',
    'TypeOFPolicy',
    'Premium',
    'action',
  ];

  dataSource!: MatTableDataSource<PolicyDTO>;
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;

  ngOnInit(): void {
    this.getAllPolicies();
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
  }

  updatePolicyDialog(row: any) {
    const dialogRef = this.dialog.open(PolicyDialogComponent, {
      width: '25%',
      data: row,
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
          alert('User deleted!');
          this.getAllPolicies();
        },
        error: (err: any) => {
          alert('Error while deleting user!');
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
