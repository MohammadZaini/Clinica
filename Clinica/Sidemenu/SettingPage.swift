//
//  SettingPage.swift
//  Clinica
//
//  Created by htu on 08/09/2022.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func signOut(){
        let signinControl = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.loginSignup) as? LoginSignUpPage
        view.window?.rootViewController = signinControl
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func signOutTapped(_ sender: UIButton) {
        
        
        do {
            try Auth.auth().signOut()
            signOut()
            
        }catch let error {
            print("failed to sign out with error...",error)
        }
        
        /*let auth = Auth.auth()
        
        do{
            
            try auth.signOut()
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: "isUserSignedIn")
            self.dismiss(animated: true, completion: nil)
        } catch let signOutError {
            self.present(service.createAlertController(title: "Error", message: signOutError.localizedDescription), animated: true, completion: nil)
            
        }*/
        
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
