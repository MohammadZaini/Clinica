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
    


    @IBOutlet weak var AppointmentsTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        AppointmentsTV.dataSource = self
        AppointmentsTV.delegate = self
        
       AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Wednesday, September 21, 2022 at 6:55 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Monday, September 12, 2022 at 3:14 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Friday, September 30, 2022 at 2:15 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Monday, September 19, 2022 at 2:09 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Sunday, September 18, 2022 at 3:10 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Tuesday, September 20, 2022 at 3:41 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Sunday, September 25, 2022 at 7:57 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Tuesday, October 11, 2022 at 7:58 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Tuesday, November 15, 2022 at 7:59 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Thursday, October 6, 2022 at 8:00 PM"))
        
        
        
        
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
