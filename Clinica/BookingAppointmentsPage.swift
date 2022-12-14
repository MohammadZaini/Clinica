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
    
    @IBAction func ConfirmButtonTapped(_ sender: UIButton) {
        
       // let db = Firestore.firestore()
        let appointmentDate = AppointmentTextfield.text!
        
        let db = Firestore.firestore()
        
        db.collection("Appointments").addDocument(data: ["Date": appointmentDate]) { error in
            
            //check for errors
            
            if error == nil {
                // No errors
                
            }else{
                
                // Handle the error
                
                self.showAlert(msg: "Please book an appointment")
                
            }
            
            
            
        }
        
        self.performSegue(withIdentifier: "appointmentSegue", sender: self)
        
        self.fetchData()
       
    }
    
    func fetchData(){
        
        let db = Firestore.firestore()
        db.collection("Appointments").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    func showAlert(msg : String){
        let alert = UIAlertController(title: "Alert", message: "Please book an appointment", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "close", style: .default))
        present(alert,animated: true,completion: nil)
        
        
    }

    
  
        
        
    }
    
  

