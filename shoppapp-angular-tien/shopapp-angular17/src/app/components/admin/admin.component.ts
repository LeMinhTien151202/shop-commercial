import { Component, OnInit } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { UserResponse } from '../../responses/user/user.response';
import { UserService } from '../../services/user.service';
import { TokenService } from '../../services/token.service';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.scss'],
  standalone: true,
  imports: [
    CommonModule,
    RouterModule,
    //FormsModule
  ],
})
export class AdminComponent implements OnInit{
  // adminComponent: string = 'orders';
  userResponse?:UserResponse | null;
  constructor(
    private userService: UserService,
    private tokenService: TokenService,
    private router: Router,
  ) {

   }
  ngOnInit() {
    this.userResponse = this.userService.getUserResponseFromLocalStorage();
   }
  logout() {
    this.userService.removeUserFromLocalStorage();
    this.tokenService.removeToken();
    this.userResponse = this.userService.getUserResponseFromLocalStorage();
    this.router.navigate(['/']);
  }

  showAdminComponent(componentName: string): void {
     //this.adminComponent = componentName;orders,categories
     if(componentName=='orders') {
      this.router.navigate(['/admin/orders']);
    } else if(componentName=='categories') {
      this.router.navigate(['/admin/categories']);
    }else if(componentName=='products') {
      this.router.navigate(['/admin/products']);
    }
  }

}
