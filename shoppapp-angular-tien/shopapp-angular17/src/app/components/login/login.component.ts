import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { UserService } from '../../services/user.service';
import { FormsModule, NgForm } from '@angular/forms';
import { LoginDTO } from '../../dtos/user/login.dto';
import { Role } from '../../models/role.';
import { UserResponse } from '../../responses/user/user.response';
import { TokenService } from '../../services/token.service';
import { RoleService } from '../../services/role.service';
import { CartService } from '../../services/cart.service';
import { LoginResponse } from '../../responses/user/login.response';
import { FooterComponent } from '../footer/footer.component';
import { HeaderComponent } from '../header/header.component';
import { CommonModule } from '@angular/common';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { ApiResponse } from '../../responses/api.response';
import { catchError, finalize, of, switchMap, tap } from 'rxjs';
import { HttpErrorResponse } from '@angular/common/http';
import { BaseComponent } from '../base/base.component';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
  standalone: true,
      imports: [
        FooterComponent,
      HeaderComponent,
      CommonModule,
      NgbModule,
      FormsModule
      ]
})
export class LoginComponent extends BaseComponent implements OnInit{
  @ViewChild('loginForm') loginForm!: NgForm;

  // phoneNumber: string = '1234567';
  // password: string = '123';

  //Login user2
  // phoneNumber: string = '0964896239';
  // password: string = '123456';

  phoneNumber: string = '1122334455';
  password: string = '123456';

  roles: Role[] = []; // Mảng roles
  rememberMe: boolean = true;
  selectedRole: Role | undefined; // Biến để lưu giá trị được chọn từ dropdown
  showPassword: boolean = false;

  userResponse?: UserResponse;
  onPhoneNumberChange() {
    console.log(`Phone typed: ${this.phoneNumber}`);
    //how to validate ? phone must be at least 6 characters
  }

  ngOnInit() {
    // Gọi API lấy danh sách roles và lưu vào biến roles
    debugger
    this.roleService.getRoles().subscribe({
      next: ({ data: roles }: ApiResponse) => { // Sử dụng kiểu Role[]
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
    const loginDTO: LoginDTO = {
      phone_number: this.phoneNumber,
      password: this.password,
      role_id: this.selectedRole?.id ?? 1
    };

    this.userService.login(loginDTO).pipe(
      tap((apiResponse: ApiResponse) => {
        const { token } = apiResponse.data;
        this.tokenService.setToken(token);
      }),
      switchMap((apiResponse: ApiResponse) => {
        const { token } = apiResponse.data;
        return this.userService.getUserDetail(token).pipe(
          tap((apiResponse2: ApiResponse) => {
            this.userResponse = {
              ...apiResponse2.data,
              date_of_birth: new Date(apiResponse2.data.date_of_birth),
            };

            if (this.rememberMe) {
              this.userService.saveUserResponseToLocalStorage(this.userResponse);
            }

            if (this.userResponse?.role.name === 'admin') {
              this.router.navigate(['/admin']);
            } else if (this.userResponse?.role.name === 'user') {
              this.router.navigate(['/']);
            }
          }),
          catchError((error: HttpErrorResponse) => {
            console.error('Lỗi khi lấy thông tin người dùng:', error?.error?.message ?? '');
            return of(null); // Tiếp tục chuỗi Observable
          })
        );
      }),
      finalize(() => {
        this.cartService.refreshCart();
      })
    ).subscribe({
      error: (error: HttpErrorResponse) => {
        this.toastService.showToast({
          error: error,
          defaultMsg: 'Sai thông tin đăng nhập',
          title: 'Lỗi Đăng Nhập'
        });
      }
    });
  }
  createAccount() {
    debugger
    // Chuyển hướng người dùng đến trang đăng ký (hoặc trang tạo tài khoản)
    this.router.navigate(['/register']);
  }
  togglePassword() {
    this.showPassword = !this.showPassword;
  }
  loginWithGoogle() {
    debugger
    this.authService.authenticate('google').subscribe({
      next: (url: string) => {
        debugger
        // Chuyển hướng người dùng đến URL đăng nhập Google
        window.location.href = url;
      },
      error: (error: HttpErrorResponse) => {
        debugger
        console.error('Lỗi khi xác thực với Google:', error?.error?.message ?? '');
      }
    });
  }

  loginWithFacebook() {
    // Logic đăng nhập với Facebook
    debugger
    this.authService.authenticate('facebook').subscribe({
      next: (url: string) => {
        debugger
        // Chuyển hướng người dùng đến URL đăng nhập Facebook
        window.location.href = url;
      },
      error: (error: HttpErrorResponse) => {
        debugger
        console.error('Lỗi khi xác thực với Facebook:', error?.error?.message ?? '');
      }
    });
  }

}
