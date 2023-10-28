import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { AuthService } from '../shared/auth.service';

@Component({
  selector: 'app-template',
  templateUrl: './template.component.html',
  styleUrls: ['./template.component.scss'],
})
export class TemplateComponent implements OnInit {
  userActivity: any;
  userInactive: Subject<any> = new Subject();
  isEmployee! : boolean;
  policyText: string = 'My Policies';
  vehicleText: string = 'My Vehicles';
  claimText: string = 'My Claims';

  name!: string;
  constructor(private router: Router, private authService: AuthService) {
    this.userInactive.subscribe(() => this.logout());
    this.isEmployee = authService.IsEmployee();
  }

  ngOnInit(): void {
    const userJson = localStorage.getItem('currentUser');
    this.name = userJson !== null ? `Hello ${userJson} ` : '';

    this.policyText = this.isEmployee === true ? 'Purchased Policies' : 'My Policies';
    this.vehicleText = this.isEmployee === true ? 'Customer Vehicles' : 'My Vehicles';
    this.claimText = this.isEmployee === true ? 'All Claims' : 'My Claims';

    //this.autoLogout(120000);
  }

  autoLogout(expirationTime: number): void {
    this.userActivity = setTimeout(
      () => this.userInactive.next(undefined),
      expirationTime
    );
  }

  logout() {
    localStorage.removeItem('token');
    localStorage.removeItem('currentUser');
    localStorage.removeItem('personId');
    localStorage.removeItem('isCustomer');
    this.router.navigate(['/login']);
  }
}
