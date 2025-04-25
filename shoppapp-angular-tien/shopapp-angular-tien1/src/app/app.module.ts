import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HomeComponent } from './components/home/home.component';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { OrderComponent } from './components/order/order.component';
import { OrderDetailComponent } from './components/order-confirm/order.detail.component';
import { LoginComponent } from './components/login/login.component';
import { DetailProductComponent } from './components/detail-product/detail-product.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule
  ,HTTP_INTERCEPTORS
 } from '@angular/common/http';
import { RegisterComponent } from './components/register/register.component';
import { TokenInterceptor } from './interceptors/token.interceptor';
import { ReactiveFormsModule } from '@angular/forms';
import { AppComponent } from './app/app.component';
import { AppRoutingModule } from './app-routing.module';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { UserProfileComponent } from './components/user-profile/user-profile.component';
import { AdminComponent } from './components/admin/admin.component';
import { OrderAdminComponent } from './components/admin/order/order.admin.component';
import { ProductAdminComponent } from './components/admin/product/product.admin.component';
import { CategoryAdminComponent } from './components/admin/category/category.admin.component';
import { DetailOrderAdminComponent } from './components/admin/detail-order/detail.order.admin.component';
import { AdminModule } from './components/admin/admin.module';

@NgModule({
  declarations: [


    HomeComponent,
            HeaderComponent,
            FooterComponent,
            OrderComponent,
            OrderDetailComponent,
            LoginComponent,
            RegisterComponent,
            DetailProductComponent,
            AppComponent,
            UserProfileComponent,
            // AdminComponent,
            // OrderAdminComponent,
            // ProductAdminComponent,
            // CategoryAdminComponent,
            // DetailOrderAdminComponent
  ],
  imports: [
    ReactiveFormsModule,
    BrowserModule,
    FormsModule,
    HttpClientModule,
    AppRoutingModule,
    NgbModule,
    AdminModule
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: TokenInterceptor,
      multi: true,
    },
  ],
  bootstrap: [
    AppComponent
    // HomeComponent,
    // OrderComponent,
    // OrderDetailComponent,
    // LoginComponent,
    // RegisterComponent,
    // DetailProductComponent
  ]
})
export class AppModule { }
