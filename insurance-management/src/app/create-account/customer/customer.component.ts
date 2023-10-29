import { Component, OnInit, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatDialog } from '@angular/material/dialog';
import { CreateAccountService } from '../create-account.service';
import { Persondetail } from '../personDetail';
import { CreateAccountComponent } from '../create-account.component';

@Component({
  selector: 'app-employee',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.scss'],
})
export class CustomerComponent implements OnInit {
  personId!: any;
  constructor(
    private accountService: CreateAccountService,
    public dialog: MatDialog
  ) {
    this.personId = localStorage.getItem('personId');
  }

  displayedColumns: string[] = [
    'UserName',
    'EmailId',
    'DateOfBirth',
    'FirstName',
    'LastName',
    'PhoneNo',
    'Status',
    'action',
  ];

  dataSource!: MatTableDataSource<Persondetail>;
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;

  ngOnInit(): void {
    this.getCustomerInfo();
  }

  getCustomerInfo() {
    this.accountService.getCustomerInfo(this.personId).subscribe({
      next: (res: Persondetail[] | undefined) => {
        this.dataSource = new MatTableDataSource(res);
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      },
      error: () => {
        alert('Error while reading Employees!');
      },
    });
  }

  updateEmployeeDialog(row: any) {
    const dialogRef = this.dialog.open(CreateAccountComponent, {
      width: '25%',
      data: row,
    });
  }
}
