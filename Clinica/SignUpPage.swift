//
//  SignUpPage.swift
//  Clinica
//
//  Created by htu on 06/09/2022.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class SignUpPage: UIViewController {

    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var PhoneNumberTextfield: UITextField!
    
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    

    @IBAction func SignUpTapped(_ sender: UIButton) {
    }
   
    
    func setUpElements(){
        
        
        errorLabel.alpha = 0
       
        
    }

}
