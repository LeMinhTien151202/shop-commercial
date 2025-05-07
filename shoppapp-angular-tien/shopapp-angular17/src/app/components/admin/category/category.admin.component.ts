import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Category } from '../../../models/category';
import { CategoryService } from '../../../services/category.service';

import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ApiResponse } from '../../../responses/api.response';
import { ToastService } from '../../../services/toast.service';
import { HttpErrorResponse } from '@angular/common/http';


@Component({
  selector: 'app-category-admin',
  templateUrl: './category.admin.component.html',
  styleUrls: [
    './category.admin.component.scss',
  ],
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
  ]
})
export class CategoryAdminComponent implements OnInit {
  categories: Category[] = []; // Dữ liệu động từ categoryService
  constructor(
    private categoryService: CategoryService,
    private router: Router,
    private toastService: ToastService
    ) {}

    ngOnInit() {
      this.getCategories(0, 100);
    }
    getCategories(page: number, limit: number) {
      this.categoryService.getCategories(page, limit).subscribe({
        next: (apiResponse) => {
          debugger;
          this.categories = apiResponse.data;
        },
        complete: () => {
          debugger;
        },
        error: (error: any) => {
          console.error('Error fetching categories:', error);
        }
      });
    }
    insertCategory() {
      debugger
      // Điều hướng đến trang detail-category với categoryId là tham số
      this.router.navigate(['/admin/categories/insert']);
    }

    // Hàm xử lý sự kiện khi sản phẩm được bấm vào
    updateCategory(categoryId: number) {
      debugger
      this.router.navigate(['/admin/categories/update', categoryId]);
    }
    deleteCategory(category: Category) {
      const confirmation = window
        .confirm('Are you sure you want to delete this category?');
      if (confirmation) {
        debugger
        this.categoryService.deleteCategory(category.id).subscribe({
          next: (apiResponse: ApiResponse) => {
            this.toastService.showToast({
              error: null,
              defaultMsg: 'Xóa danh mục thành công',
              title: 'Thành Công'
            });
            location.reload();
          },
          error: (error: HttpErrorResponse) => {
            this.toastService.showToast({
              error: error,
              defaultMsg: 'Lỗi khi xóa danh mục',
              title: 'Lỗi Xóa'
            });
          }
        });
      }
    }
}
