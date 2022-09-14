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
import FirebaseAuth

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
        
        if AppointmentTextfield.text == "" {
            self.showAlert()
        }else{
            
        let appointmentDate = AppointmentTextfield.text!
        
        let db = Firestore.firestore()
        
        db.collection("Appointments").addDocument(data: ["Date": appointmentDate, "user_id" : Auth.auth().currentUser!.uid]) { error in
            
            //check for errors
            
            if error == nil {
                // No errors
               // self.test()
                
            }else{
                
                // Handle the error
                
                self.showAlert()
                
            }
            
            
            
        }
        
        //self.performSegue(withIdentifier: "appointmentSegue", sender: self)
            self.test()
        //self.fetchData()
        }
    }
    
    func test(){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeTabBar
        view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
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
    
    func showAlert(){
        let alert = UIAlertController(title: "Alert", message: "You have to book an appointment first", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "close", style: .default))
        present(alert,animated: true,completion: nil)
       
        
    }

    
  
        
        
    }
    
  

