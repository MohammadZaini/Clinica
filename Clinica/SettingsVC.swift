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
    
    
    @IBAction func DeleteAccountTapped(_ sender: UIButton) {
        
        
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
    }
    
    @IBAction func SignOutTapped(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
           signOut()
            
        }catch let error {
            print("failed to sign out with error...",error)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
