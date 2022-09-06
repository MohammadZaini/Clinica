//
//  LoginSignUpPage.swift
//  Clinica
//
//  Created by htu on 07/09/2022.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class LoginSignUpPage: UIViewController {

    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    

    func setUpElements(){
        
        Utilities.styleHollowButton(SignUpButton)
        Utilities.styleHollowButton(LoginButton)
    }
}
