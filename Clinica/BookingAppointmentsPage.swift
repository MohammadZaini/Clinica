//
//  BookingAppointmentsPage.swift
//  Clinica
//
//  Created by htu on 07/09/2022.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class BookingAppointmentsPage: UIViewController {
    
    
    @IBOutlet weak var AppointmentsDatePicker: UIDatePicker!
        
    @IBOutlet weak var AppointmentTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       test()
    }
    

    func test(){
        
        
        self.AppointmentTextfield.text = "\(AppointmentsDatePicker.date)"
    }

}
