import { DOCUMENT } from '@angular/common';
import { Inject, Injectable } from '@angular/core';
import { JwtHelperService } from '@auth0/angular-jwt';

@Injectable({
  providedIn: 'root',
})
export class TokenService {
    private readonly TOKEN_KEY = 'access_token';
    private jwtHelperService = new JwtHelperService();
    localStorage?:Storage;

    constructor(@Inject(DOCUMENT) private document: Document){this.localStorage = document.defaultView?.localStorage;}
    //getter/setter
    getToken():string {
      return this.localStorage?.getItem(this.TOKEN_KEY) ?? '';
  }
    setToken(token: string): void {
      this.localStorage?.setItem(this.TOKEN_KEY, token);
    }
    removeToken(): void {
      this.localStorage?.removeItem(this.TOKEN_KEY);
    }

    getUserId(): number {
      let userObject = this.jwtHelperService.decodeToken(this.getToken() ?? '');
      return 'userId' in userObject ? parseInt(userObject['userId']) : 0;
    }

    isTokenExpired(): boolean {
        if(this.getToken() == null) {
            return false;
        }
        return this.jwtHelperService.isTokenExpired(this.getToken()!);
    }
}
