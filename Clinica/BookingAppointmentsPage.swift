//
//  BookingAppointmentsPage.swift
//  Clinica
//
//  Created by htu on 07/09/2022.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class BookingAppointmentsPage: UIViewController {
    
    
    @IBOutlet weak var AppointmentsDatePicker: UIDatePicker!
        
    @IBOutlet weak var AppointmentTextfield: UITextField!
    @IBOutlet weak var ConfirmButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppointmentsDatePicker.locale = .current
        AppointmentsDatePicker.date = Date()
        AppointmentsDatePicker.minimumDate = Date()
        AppointmentsDatePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
       
        Utilities.styleTextField(AppointmentTextfield)
        Utilities.styleHollowButton(ConfirmButton)
        

    
    }
    

    
    
    @objc func dateSelected(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .short
        let date = dateFormatter.string(from: AppointmentsDatePicker.date)
        AppointmentTextfield.text = date
        
    }
    
    func addDate(date : Int  , time : Int){
        
        let db = Firestore.firestore()
        
       // db.collection("Appointments").addDocument(data: []) { <#Error?#> in
            
        //}
        
        
    }
    
  
}
