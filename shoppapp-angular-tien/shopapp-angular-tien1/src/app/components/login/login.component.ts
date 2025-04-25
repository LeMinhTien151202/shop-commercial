import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { UserService } from '../../services/user.service';
import { NgForm } from '@angular/forms';
import { LoginDTO } from '../../dtos/user/login.dto';
import { LoginResponse } from 'src/app/responses/user/login.response';
import { TokenService } from 'src/app/services/token.service';
import { RoleService } from 'src/app/services/role.service';
import { Role } from 'src/app/models/role.';
import { UserResponse } from 'src/app/responses/user/user.response';
import { CartService } from 'src/app/services/cart.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit{
  @ViewChild('loginForm') loginForm!: NgForm;

  // phoneNumber: string = '1234567';
  // password: string = '123';

  //Login user2
  phoneNumber: string = '0964896239';
  password: string = '123456';

  // phoneNumber: string = '1122334455';
  // password: string = '123456';

  roles: Role[] = []; // Mảng roles
  rememberMe: boolean = true;
  selectedRole: Role | undefined; // Biến để lưu giá trị được chọn từ dropdown

  userResponse?: UserResponse;
  onPhoneNumberChange() {
    console.log(`Phone typed: ${this.phoneNumber}`);
    //how to validate ? phone must be at least 6 characters
  }
  constructor(
    private router: Router,
    private userService: UserService,
    private tokenService : TokenService,
    private roleService: RoleService,
    private cartService: CartService

  ) { }

  ngOnInit() {
    // Gọi API lấy danh sách roles và lưu vào biến roles
    debugger
    this.roleService.getRoles().subscribe({
      next: (roles: Role[]) => { // Sử dụng kiểu Role[]
        debugger
        this.roles = roles;
        this.selectedRole = roles.length > 0 ? roles[0] : undefined;
      },
      error: (error: any) => {
        debugger
        console.error('Error getting roles:', error);
      }
    });
  }

  login() {
    const message = `phone: ${this.phoneNumber}` +
      `password: ${this.password}`;
    //alert(message);
    debugger

    const loginDTO: LoginDTO = {
      phone_number: this.phoneNumber,
      password: this.password,
      role_id: this.selectedRole?.id ?? 1
    };
    this.userService.login(loginDTO).subscribe({
      next: (response: LoginResponse) => {
        const {token} = response;
        if (this.rememberMe) {
          this.tokenService.setToken(token);
        }
        debugger;
        this.userService.getUserDetail(token).subscribe({
          next: (response: any) => {
            debugger
            this.userResponse = {
              ...response,
              date_of_birth: new Date(response.date_of_birth),
            };
            this.userService.saveUserResponseToLocalStorage(this.userResponse);
            if(this.userResponse?.role.name == 'admin') {
              this.router.navigate(['/admin']);
            } else if(this.userResponse?.role.name == 'user') {
              this.router.navigate(['/']);
            }
          },
          complete: () => {
            debugger;
            this.cartService.refreshCart();
          },
          error: (error: any) => {
            debugger;
            alert(error.error.message);
          }
        })
        //this.router.navigate(['/login']);
      },
      complete: () => {
        debugger;
      },
      error: (error: any) => {
        debugger;
        alert(error.error.message);
      }
    });
  }

}
