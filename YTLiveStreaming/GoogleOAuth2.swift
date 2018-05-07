//
//  GoogleOAuth2.swift
//  YTLiveStreaming
//
//  Created by Sergey Krotkih on 10/28/16.
//  Copyright © 2016 Sergey Krotkih. All rights reserved.
//

import Foundation
import UIKit
import AlamofireOauth2
import KeychainAccess

// Developer console
// https://console.developers.google.com/apis

// Create your own clientID at https://console.developers.google.com/project (secret can be left blank!)
// For more info see https://developers.google.com/identity/protocols/OAuth2WebServer#handlingtheresponse
// And https://developers.google.com/+/web/api/rest/oauth

class GoogleOAuth2: NSObject {

   var _googleOauth2Settings: Oauth2Settings?
   let keychain:  Keychain
   let kOAuth2AccessTokenService: String = "OAuth2AccessToken"
    var token = ""
    
   class var sharedInstance: GoogleOAuth2 {
      struct Singleton {
         static let instance = GoogleOAuth2()
      }
      return Singleton.instance
   }
   
   override init() {
      self.keychain = Keychain(service: Auth.BaseURL)
      super.init()
   }
   
   private var googleOauth2Settings: Oauth2Settings {
      if _googleOauth2Settings == nil {
         _googleOauth2Settings = Oauth2Settings(baseURL: Auth.BaseURL,
                                                authorizeURL: Auth.AuthorizeURL,
                                                tokenURL: Auth.TokenURL,
                                                redirectURL: Auth.RedirectURL,
                                                clientID: Credentials.clientID,
                                                clientSecret: Auth.ClientSecret,
                                                scope: Auth.Scope)
      }
      return _googleOauth2Settings!
   }

   func requestToken(_ completion: @escaping (String?) -> Void) {    
         completion(token)
   }
   
   func clearToken() {
      Oauth2ClearTokensFromKeychain(googleOauth2Settings)
   }
   
   func isAccessTokenPresented(completion: (Bool) -> Void) {
      if keychain[kOAuth2AccessTokenService] != nil {
         completion(true)
      } else {
         completion(false)
      }
   }
   
}
