import { Injectable, Inject, PLATFORM_ID } from '@angular/core';
import { isPlatformBrowser } from '@angular/common';

@Injectable({
  providedIn: 'root'
})
export class ToastService {
  constructor(@Inject(PLATFORM_ID) private platformId: object) {}

  showToast({ error, defaultMsg: defaultMessage, title = '', delay = 5000 }: {
    error?: any,
    defaultMsg: string,
    title?: string,
    delay?: number
  }) {
    // Kiểm tra nếu đang chạy trên trình duyệt
    if (!isPlatformBrowser(this.platformId)) {
      return;
    }

    let message = defaultMessage;
    let toastClass = 'bg-danger'; // Mặc định là lỗi

    if (!error) {
      toastClass = 'bg-success'; // Thành công
    }

    if (error) {
      if (error.error && error.error.message) {
        message = error.error.message;
      } else if (typeof error === 'string') {
        message = error;
      }
    }

    // Tạo container nếu chưa có
    let toastContainer = document.getElementById('toast-container');
    if (!toastContainer) {
      toastContainer = document.createElement('div');
      toastContainer.id = 'toast-container';
      toastContainer.style.position = 'fixed';
      toastContainer.style.top = '20px';
      toastContainer.style.right = '20px';
      toastContainer.style.zIndex = '9999';
      document.body.appendChild(toastContainer);
    }

    // Tạo toast element
    const toast = document.createElement('div');
    toast.classList.add('toast', 'show', toastClass, 'text-white');
    toast.style.minWidth = '300px';
    toast.style.marginBottom = '1rem';
    toast.style.borderRadius = '4px';
    toast.style.boxShadow = '0 2px 10px rgba(0,0,0,0.1)';

    // Nội dung toast
    toast.innerHTML = `
      <div class="toast-header" style="display: flex; justify-content: space-between; align-items: center; padding: 12px">
        <strong>${title}</strong>
        <button type="button" class="close-btn" style="background: none; border: none; color: white; cursor: pointer">
          &times;
        </button>
      </div>
      <div class="toast-body" style="padding: 12px">
        ${message}
      </div>
    `;

    // Thêm vào container
    toastContainer.appendChild(toast);

    // Tự động ẩn sau delay
    const timeoutId = setTimeout(() => {
      toast.remove();
    }, delay);

    // Xử lý đóng manual
    toast.querySelector('.close-btn')?.addEventListener('click', () => {
      clearTimeout(timeoutId);
      toast.remove();
    });
  }
}
