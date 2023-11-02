import { Component, OnInit, ViewChild } from '@angular/core';
import { MyClaimsService } from './my-claims.service';
import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { MatSort } from '@angular/material/sort';
import { MatPaginator } from '@angular/material/paginator';
import { GetClaim } from './myClaimsDTO';
import { MyClaimsDialogComponent } from './my-claims-dialog/my-claims-dialog.component';
import { AuthService } from '../shared/auth.service';
import { ApproveClaimDialogComponent } from './approve-claim-dialog/approve-claim-dialog.component';
import {
  animate,
  state,
  style,
  transition,
  trigger,
} from '@angular/animations';

@Component({
  selector: 'app-my-claims',
  templateUrl: './my-claims.component.html',
  styleUrls: ['./my-claims.component.scss'],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition(
        'expanded <=> collapsed',
        animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')
      ),
    ]),
  ],
})
export class MyClaimsComponent implements OnInit {
  constructor(
    private myClaimsService: MyClaimsService,
    public dialog: MatDialog,
    private authService: AuthService
  ) {
    this.personId = localStorage.getItem('personId');
  }

  columnsToDisplayWithExpand: string[] = [
    'ClaimID',
    'CustomerPolicyID',
    'ClaimType',
    'ClaimAmount',
    'SettlementStatus',
    'ApprovedBy',
    'ApprovedAmount',
    'ClaimIntimationDate',
    'Documents',
  ];
  expandedElement!: GetClaim;

  dataSource!: MatTableDataSource<GetClaim>;
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  personId!: any;
  file: any;
  fileName: string = '';
  isEmployee!: boolean;

  ngOnInit(): void {
    this.getMyClaims();
    this.isEmployee = this.authService.IsEmployee();
    if (this.isEmployee) {
      this.columnsToDisplayWithExpand.push('Approve');
    }
    this.columnsToDisplayWithExpand.push('expand');
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
    dialogRef.afterClosed().subscribe((data) => {
      this.getMyClaims();
    });
  }

  approve(row: GetClaim) {
    const dialogRef = this.dialog.open(ApproveClaimDialogComponent, {
      width: '25%',
      data: row,
    });
    dialogRef.afterClosed().subscribe((data) => {
      this.getMyClaims();
    });
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }

  getFile(event: any, claimId: string) {
    this.file = event.target.files[0];
    this.fileName = this.file.name;

    this.myClaimsService
      .uploadDocument(claimId, this.file, this.fileName)
      .subscribe({
        next: () => {
          alert('Document uploaded Successfully.');
        },
        error: () => {
          alert('Error while uploading document.');
        },
      });
  }

  downloadFile(row: GetClaim) {
    this.myClaimsService
      .downloadDocument(row.claimID, row.documentName)
      .subscribe({
        next: (response: any) => {
          console.log(response);
          let fileName = response.headers
            .get('content-disposition')
            ?.split(';')[1]
            .split('=')[1];

          let blob: Blob = response.body as Blob;
          let a: any = document.createElement('a');
          a.download = fileName;
          a.href = window.URL.createObjectURL(blob);
          a.click();
        },
        error: () => {
          alert('Error while reading policies!');
        },
      });
  }
}
