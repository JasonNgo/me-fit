//
//  LoginManager.swift
//  me-fit
//
//  Created by Jason Ngo on 2016-11-01.
//  Copyright © 2016 Jason Ngo. All rights reserved.
//

import Foundation
import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit
import SwiftKeychainWrapper

class LoginManager {
    static let lm = LoginManager()
    
    func authenticateFirebaseUser(withEmail email: String, andPassword password: String) -> Bool {
        
        var isAuthSuccessful: Bool = false
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                
                if let errCode = FIRAuthErrorCode(rawValue: error!._code) {
                    
                    switch errCode {
                    case .errorCodeWrongPassword,
                         .errorCodeInvalidEmail:
                        print("DEBUG: Invalid email/password credentials\n")
                    default:
                        print("DEBUG: Authenticate User Error: \(error)\n")
                    }
                    
                }
                
            } else {
                print("DEBUG: User authentication successful\n")
                isAuthSuccessful = true
            }
            
        })
        
        return isAuthSuccessful
    }
    
    func authenticateFacebookUser() -> Bool {
        
        var isAuthSuccessful: Bool = false
        let fbLoginManager = FBSDKLoginManager()
        
        fbLoginManager.logIn(withReadPermissions: ["email"], from: nil) { (result, error) in
            if error != nil {
                print("DEBUG: Unable to authenticate with Facebook - \(error)\n")
            } else if result?.isCancelled == true {
                print("DEBUG: User cancelled Facebook authentication\n")
            } else {
                print("DEBUG: Successfully authenticated with Facebook\n")
                
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                
                FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
                    if error != nil {
                        print("DEBUG: Unable to authenticate FB user with Firebase - \(error)\n")
                    } else {
                        print("DEBUG: Successfully authenticated FB user with Firebase\n")
                        
                        isAuthSuccessful = true
                    }
                })
            }
        }
        
        return isAuthSuccessful
    }
    
}
