//
//  FavoritesPage.swift
//  Clinica
//
//  Created by HTU on 8/24/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class FavoritesPage: UIViewController {

    @IBOutlet weak var FavoriteTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    

}

struct favorite {
    
    let doctorN         : String
    let telePhoneNum    : String
    let locationN       : String
    let WorkingHoursLbl : String
    let Appointmentlbl  : String
    let reviews         : String
}
