//
//  ViewController.swift
//  Clinica
//
//  Created by HTU on 8/24/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var EmailTextfield: UITextField!
    
    
    @IBOutlet weak var PasswordTextfield: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = EmailTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeTabBar
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
        
        
        
    }
    
    func setUpElements(){
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(EmailTextfield)
        Utilities.styleTextField(PasswordTextfield)
        Utilities.styleHollowButton(loginButton)
    
        
        
    }
    
}

