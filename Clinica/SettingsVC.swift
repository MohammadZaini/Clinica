//
//  SettingsVC.swift
//  Clinica
//
//  Created by htu on 23/09/2022.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth


class SettingsVC: UIViewController {
    
    func signOut(){
         let signinControl = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.loginSignup) as? LoginSignUpPage
        
         view.window?.rootViewController = signinControl
         view.window?.makeKeyAndVisible()
     }
    
   
    
    @IBAction func ProfileTapped(_ sender: UIButton) {
        
        let profile = self.storyboard?.instantiateViewController(withIdentifier: "Profile")  as! ProfilePage
        
        self.navigationController?.pushViewController(profile, animated: true)
    }
    
    @IBOutlet weak var DeleteBtnOutlet: UIButton!
    
    @IBAction func DeleteAccountTapped(_ sender: UIButton) {
        self.showAlert()
        
      /* let db = Firestore.firestore()
        
        let user = Auth.auth().currentUser

        user?.delete { error in
          if let error = error {
            // An error happened.
              print("Didn't work!!")
          } else {
            // Account deleted.
              print("Account has been deleted successfully")
              self.signOut()
          }
        }*/
    }
    
    @IBAction func SignOutTapped(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
           signOut()
            
        }catch let error {
            print("failed to sign out with error...",error)
        }
    }
    
    
    func showAlert(){
        
        let alert = UIAlertController(title: "Account Deletion", message: "Are you sure you want to delete your account?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { action in
            
            let db = Firestore.firestore()
             
             let user = Auth.auth().currentUser

             user?.delete { error in
               if let error = error {
                 // An error happened.
                   print("Didn't work!!")
               } else {
                 // Account deleted.
                   print("Account has been deleted successfully")
                   self.signOut()
               }
             }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.styleFilledButton(DeleteBtnOutlet)
    }
    

 

}
