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
     
    let refreshControl = UIRefreshControl()
    
    @objc func updateData(){
        refreshControl.endRefreshing()
        AppointmentsTV.reloadData()
        
        }
  
    @IBOutlet weak var AppointmentsTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppointmentsTV.dataSource = self
        AppointmentsTV.delegate = self
        
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        AppointmentsTV.addSubview(refreshControl)
        
       /*AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Wednesday, September 21, 2022 at 6:55 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Monday, September 12, 2022 at 3:14 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Friday, September 30, 2022 at 2:15 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Monday, September 19, 2022 at 2:09 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Sunday, September 18, 2022 at 3:10 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Tuesday, September 20, 2022 at 3:41 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Sunday, September 25, 2022 at 7:57 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Tuesday, October 11, 2022 at 7:58 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Tuesday, November 15, 2022 at 7:59 PM"))
        AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "Thursday, October 6, 2022 at 8:00 PM"))*/
        
    
        
        
        loadData()
       
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("Array count is :\(AppointmentsArray.count)")
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
                self.AppointmentsArray.remove(at: indexPath.row)
                
                
                self.AppointmentsTV.beginUpdates()
                self.AppointmentsTV.deleteRows(at: [indexPath], with: .automatic)
                self.AppointmentsTV.endUpdates()
                completionHandler(true)
            }
            
            self.deleteAppointment()

            return UISwipeActionsConfiguration(actions: [deleteAction])
        }

    
   
    
    func loadData()  {
            let db = Firestore.firestore()
        db.collection("Appointments").whereField("user_id", isEqualTo: Auth.auth().currentUser!.uid).getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting from firestore: \(err)")
                        
                    }else {
                        print("Documents have been retrieved successfully")
                        for document in querySnapshot!.documents {
                            
                            print("\(document.documentID) => \(document.data())")
                            self.AppointmentsArray.append(Appointment.init(AppointmentImage: UIImage(systemName: "calendar")!, theAppointment: "\(document.get("Date")!)"))
                            
                            //let  docID = document.documentID
                            
                            
                            
                }
                        self.AppointmentsTV.reloadData()    

}
            
        
            
        }
        
        
    
            }
    
    
    
    func deleteAppointment(){
        
        let db = Firestore.firestore()
      
      
        
        db.collection("Appointments").document().delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
                
                
            } else {
                
              
                print("Document successfully removed!")
            }
        }
    }


    
struct Appointment{
    let AppointmentImage : UIImage
    let theAppointment : String
    
}
    
}
