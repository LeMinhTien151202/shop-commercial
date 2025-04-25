import { Component, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from '../../services/user.service';
import { RegisterDTO } from '../../dtos/user/register.dto';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent {
  @ViewChild('registerForm') registerForm!: NgForm;

  phoneNumber: string = '1234567';
  password: string = '123';
  retypePassword: string = '123';
  fullName: string = 'tien';
  address: string = 'gfgff';
  isAccepted: boolean = true;
  dateOfBirth: Date = new Date();

  constructor(private router: Router, private userService: UserService) {
    this.dateOfBirth.setFullYear(this.dateOfBirth.getFullYear() - 18);
  }

  onPhoneNumberChange() {
    console.log(`Phone typed: ${this.phoneNumber}`);
    // Validate: Phone must be at least 6 characters
    if (this.phoneNumber.length < 6) {
      this.registerForm.form.controls['phoneNumber']?.setErrors({ minLength: true });
    } else {
      this.registerForm.form.controls['phoneNumber']?.setErrors(null);
    }
  }

  register() {
    const message =
      `phone: ${this.phoneNumber}` +
      `password: ${this.password}` +
      `retypePassword: ${this.retypePassword}` +
      `address: ${this.address}` +
      `fullName: ${this.fullName}` +
      `isAccepted: ${this.isAccepted}` +
      `dateOfBirth: ${this.dateOfBirth}`;
    console.log(message);

    const registerDTO: RegisterDTO = {
      fullname: this.fullName,
      phone_number: this.phoneNumber,
      address: this.address,
      password: this.password,
      retype_password: this.retypePassword,
      date_of_birth: this.dateOfBirth,
      facebook_account_id: 0,
      google_account_id: 0,
      role_id: 1
    };

    console.log('Đang gọi API đăng ký với dữ liệu:', registerDTO);
    this.userService.register(registerDTO).subscribe({
      next: (response: any) => {
        console.log('API trả về:', response);
        debugger;
        if (response && (response.status === 200 || response.status === 201)) {
          this.router.navigate(['/login']);
        }
      },
      error: (error: any) => {
        console.error("Lỗi API:", error);

        let errorMessage = "Đã xảy ra lỗi!";
        if (error.error) {
          errorMessage = error.error; // Nếu API trả về lỗi dạng text
        } else if (error.message) {
          errorMessage = error.message; // Trường hợp lỗi khác
        }

        alert(`Lỗi đăng ký: ${errorMessage}`);
        debugger
      },
      complete: () => {
        alert("hoan tat dang ky");
        debugger;
      }
    });
  }

  checkPasswordsMatch() {
    if (this.password !== this.retypePassword) {
      this.registerForm.form.controls['retypePassword'].setErrors({ passwordMismatch: true });
    } else {
      this.registerForm.form.controls['retypePassword'].setErrors(null);
    }
  }

  checkAge() {
    if (this.dateOfBirth) {
      const today = new Date();
      const birthDate = new Date(this.dateOfBirth);
      let age = today.getFullYear() - birthDate.getFullYear();
      const monthDiff = today.getMonth() - birthDate.getMonth();
      if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
        age--;
      }

      if (age < 18) {
        this.registerForm.form.controls['dateOfBirth'].setErrors({ invalidAge: true });
      } else {
        this.registerForm.form.controls['dateOfBirth'].setErrors(null);
      }
    }
  }
}
