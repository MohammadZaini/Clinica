//
//  Service.swift
//  Clinica
//
//  Created by htu on 20/09/2022.
//  Copyright © 2022 HTU. All rights reserved.
//

import Foundation
import UIKit
class service {
    
    static func createAlertController(title : String, message : String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        return alert
    }
}
