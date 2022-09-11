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
    var AgreeIconClick : Bool! = false

    @IBOutlet weak var EmailTextfield: UITextField!
    
    
    @IBOutlet weak var PasswordTextfield: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var RemeberMeButton: UIButton!
    
   /*@IBAction func RememberMeTapped(_ sender: UIButton) {
        
        if(AgreeIconClick == false) {

         if let image = UIImage(named: "checkImg") {
           RemeberMeButton.setBackgroundImage(image, for: .normal)
         }
            AgreeIconClick = true
            
         } else {
         if let image = UIImage(named: "uncheckimg") {
           RemeberMeButton.setBackgroundImage(image, for: .normal)
        }
            AgreeIconClick = false
        }
        
        
       
        
        
    }*/
    
   /*func checkAndAdd(){
        
        if UserDefaults.standard.string(forKey: "rememberMe") == "1" {

         if let image = UIImage(named: "checkImg") {
         RemeberMeButton.setBackgroundImage(image, for: .normal)
          }

         AgreeIconClick = true

         // Set values
                  self.EmailTextfield.text = UserDefaults.standard.string(forKey: "userMail") ?? ""
                  self.PasswordTextfield.text = UserDefaults.standard.string(forKey: "userPassword") ?? ""

         }else{

         if let image = UIImage(named: "uncheckimg") {
         RemeberMeButton.setBackgroundImage(image, for: .normal)
         }

         AgreeIconClick = false
        }
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        //checkAndAdd()
        
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        
       /* if(AgreeIconClick == true) {

        UserDefaults.standard.set("1", forKey: "rememberMe")
        UserDefaults.standard.set(EmailTextfield.text ?? "" , forKey: "userMail")
        UserDefaults.standard.set(PasswordTextfield.text ?? "", forKey: "userPassword")

        print("Mail & Password Saved Successfully")

        }else{

        UserDefaults.standard.set("2", forKey: "rememberMe")

        }*/
        
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

