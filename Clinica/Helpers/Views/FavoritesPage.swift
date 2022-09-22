//
//  FavoritesPage.swift
//  Clinica
//
//  Created by HTU on 8/24/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit
import FirebaseFirestore

class FavoritesPage: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var FavoriteArray = [Favorite]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoriteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FavoriteTableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteTVCell
          
        let data = FavoriteArray[indexPath.row]
    
   //cell.addtoFavorite.addTarget(self, action: #selector(addToFavorite(sender:)), for: .touchUpInside)
    
   /*cell.setUpCell(doctorName1: data.doctorN, TelephoneNumber1: data.telePhoneNum, locationName1: data.locationN, WorkingHours: data.WorkingHoursLbl, appointment: data.Appointmentlbl, review1: data.reviews)*/
    
       cell.tintColor = .black
    
       //cell.setUpCell(firstImage: data.doctorPhoto, secondImage: data.telephonePhoto, thirdImage: data.locationPhoto, forthImage: data.WorkingHoursPhoto, fifthImage: data.AppointmentPhoto, sixthImage: data.reviewPhoto, doctorName1: data.doctorN, TelephoneNumber1: data.telePhoneNum, locationName1: data.locationN, WorkingHours: data.reviews, appointment: data.Appointmentlbl, review1: data.WorkingHoursLbl)
        
       // let data = arrClinics[indexPath.row]
       // cell.setUpCell(firstImage: data.doctorPhoto, secondImage: data.telephonePhoto, thirdImage: data.locationPhoto, forthImage: data.reviewPhoto, doctorName1: data.doctorN,                      TelephoneNumber1: data.telePhoneNum, locationName1: data.locationN, review1: data.reviews)*/
    cell.setUpCell(doctorName1: data.doctorN, TelephoneNumber1: data.telePhoneNum, locationName1: data.locationN, WorkingHours: data.WorkingHoursLbl, appointment: data.Appointmentlbl, review1: data.reviews)
   
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
                self.FavoriteArray.remove(at: indexPath.row)
                
                
                self.FavoriteTableView.beginUpdates()
                self.FavoriteTableView.deleteRows(at: [indexPath], with: .automatic)
                self.FavoriteTableView.endUpdates()
                completionHandler(true)
            }
            
           // self.deleteAppointment()

            return UISwipeActionsConfiguration(actions: [deleteAction])
        }

    
    

    @IBOutlet weak var FavoriteTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FavoriteTableView.delegate = self
        FavoriteTableView.dataSource = self
        loadData()
    }
    
    func loadData()  {
        let db = Firestore.firestore()
            db.collection("Favorite").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting from firestore: \(err)")
                    
                }else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        
                       // self.arrClinics.append(Clinics.init(doctorPhoto: UIImage(systemName: "person")!, telephonePhoto: UIImage(systemName: "teletype")!, locationPhoto: UIImage(systemName: "location.fill")!, WorkingHoursPhoto: UIImage(systemName: "clock")!, AppointmentPhoto: UIImage(systemName: "calendar")!, reviewPhoto: UIImage(systemName: "doc.text.fill")!, doctorN: document.get("Doctor Name") as! String, telePhoneNum: document.get("Clinic Number") as! String, locationN: document.get("Clinic Location") as! String, WorkingHoursLbl: document.get("Working Hours") as! String, Appointmentlbl: document.get("Booking appointment") as! String, reviews: document.get("Reviews") as! String))
                        
                        self.FavoriteArray.append(Favorite.init(doctorN: document.get("Doctor Name") as! String, telePhoneNum: document.get("Clinic Number") as! String, locationN: document.get("Clinic Location") as! String, WorkingHoursLbl: document.get("Working Hours") as! String, Appointmentlbl: document.get("Booking appointment") as! String, reviews: document.get("Reviews") as! String))
                        
                       
                        print("\(self.FavoriteArray) from array###")
                        
                    }
                    self.FavoriteTableView.reloadData()
                }
        }
    }

  
 
    

}

struct Favorite {
  
    let doctorN         : String
    let telePhoneNum    : String
    let locationN       : String
    let WorkingHoursLbl : String
    let Appointmentlbl  : String
    let reviews         : String
}
