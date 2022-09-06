//
//  ViewController.swift
//  Clinica
//
//  Created by HTU on 8/24/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var EmailTextfield: UITextField!
    
    
    @IBOutlet weak var PasswordTextfield: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        
        
        
        
        
    }
    
    func setUpElements(){
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(EmailTextfield)
        Utilities.styleTextField(PasswordTextfield)
    
        
        
    }
    
}

