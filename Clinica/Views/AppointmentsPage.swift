//
//  AppointmentsPage.swift
//  Clinica
//
//  Created by HTU on 8/24/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore


class AppointmentsPage: UIViewController , UITableViewDelegate ,UITableViewDataSource {
   
    var AppointmentsArray = [Appointment]()
    
    @IBAction func test2(_ sender: UIButton) {
        loadData()
    }
    

    @IBOutlet weak var AppointmentsTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        AppointmentsTV.dataSource = self
        AppointmentsTV.delegate = self
        
      /*  AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: ""))*/
        
        loadData()
       
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppointmentsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AppointmentsTV.dequeueReusableCell(withIdentifier: "AppointmentCell", for: indexPath) as! AppointmentTVCell
        
        let myData = AppointmentsArray[indexPath.row]
        //cell.TheAppointment.text =
        //cell.AppointmentIcon.image = UIImage(systemName: "calendar")
        
       cell.setUpCell(AppointImg: myData.AppointmentImage, theAppoint: myData.theAppointment)
        return cell
    }
    
    
    func loadData()  {
            let db = Firestore.firestore()
        db.collection("Appointments").whereField("user_id", isEqualTo: Auth.auth().currentUser!.uid).getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting from firestore: \(err)")
                        
                    }else {
                        for document in querySnapshot!.documents {
                            print("\(document.documentID) => \(document.data())")
                            self.AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "\(document.get("Date")!)"))
                            
                }

}
                                                          }
                                                          }

struct Appointment{
    let AppointmentImage : UIImage
    let theAppointment : String
    
}}
