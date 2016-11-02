//
//  SignInVC.swift
//  me-fit
//
//  Created by Jason Ngo on 2016-11-01.
//  Copyright © 2016 Jason Ngo. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorMsgLbl: UILabel!
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func signInBtnPressed(_ sender: AnyObject) {
        print("DEBUG: Sign in button pressed")
        
        guard let email = emailField.text, email != "" else {
            print("DEBUG: Email field missing content")
            return
        }
        
        guard let password = passwordField.text, password != "" else {
            print("DEBUG: Password field missing content")
            return
        }
        
        let authSuccessful = LoginManager.lm.authenticateFirebaseUser(withEmail: email, andPassword: password)
        
        if authSuccessful {
            
        } else {
            // Display error message
        }
        
    }
    
}

