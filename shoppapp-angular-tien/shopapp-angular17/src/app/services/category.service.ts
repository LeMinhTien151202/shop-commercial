import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../environments/environment';
import { Category } from '../models/category';
import { UpdateCategoryDTO } from '../dtos/category/update.category.dto';
import { InsertCategoryDTO } from '../dtos/category/insert.category.dto';
import { ApiResponse } from '../responses/api.response';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {
  private apiGetCategories  = `${environment.apiBaseUrl}/categories`;

  constructor(private http: HttpClient) { }
  getCategories(page: number, limit: number):Observable<ApiResponse> {
    const params = new HttpParams()
      .set('page', page.toString())
      .set('limit', limit.toString());
      return this.http.get<ApiResponse>(this.apiGetCategories, { params });
  }
  getDetailCategory(id: number): Observable<ApiResponse> {
    return this.http.get<ApiResponse>(`${environment.apiBaseUrl}/categories/${id}`);
  }
  deleteCategory(id: number): Observable<ApiResponse> {
    debugger
    return this.http.delete<ApiResponse>(`${environment.apiBaseUrl}/categories/${id}`);
  }
  updateCategory(id: number, updatedCategory: UpdateCategoryDTO): Observable<ApiResponse> {
    return this.http.put<ApiResponse>(`${environment.apiBaseUrl}/categories/${id}`, updatedCategory);
  }
  insertCategory(insertCategoryDTO: InsertCategoryDTO): Observable<ApiResponse> {
    // Add a new category
    return this.http.post<ApiResponse>(`${environment.apiBaseUrl}/categories`, insertCategoryDTO);
  }
}
