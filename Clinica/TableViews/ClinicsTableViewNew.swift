//
//  ClinicsTableViewNew.swift
//  Clinica
//
//  Created by htu on 8/28/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class ClinicsTableViewNew: UIViewController, UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate {
    

     var arrSection = ["First Clinic","Second Clinic","Third Clinic"]
     var arrClinics = [Clinics]()
    
    
     var filterdData = [String]()
 
    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var ClinicaTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ClinicaTableView.delegate = self
        ClinicaTableView.dataSource = self
        
        
        
        filterdData = ["\(arrClinics)"]
        
        /*arrClinics.append(Clinics.init(doctorPhoto: UIImage(systemName: "person")!, telephonePhoto: UIImage(systemName: "teletype")!, locationPhoto: UIImage(systemName: "location.fill" )!, reviewPhoto: UIImage(systemName: "doc.text.fill")!, doctorN: "Dr.Ahmad", telePhoneNum:  0775148625, locationN: "KHalda", reviews: "Reviews"))*/
        
        arrClinics.append(Clinics.init(doctorPhoto: UIImage(systemName: "person")!, telephonePhoto: UIImage(systemName: "teletype")!, locationPhoto:UIImage(systemName: "location.fill")! , WorkingHoursPhoto: UIImage(systemName: "clock")!, AppointmentPhoto: UIImage(systemName: "calendar")!, reviewPhoto: UIImage(systemName: "doc.text.fill")!, doctorN: "Dr.Nadeem", telePhoneNum: 0788844111, locationN: "Bayader", WorkingHoursLbl: "9-5", Appointmentlbl: "Book An Appointment", reviews: "leave a review"))
        
        arrClinics.append(Clinics.init(doctorPhoto: UIImage(systemName: "person")!, telephonePhoto: UIImage(systemName: "teletype")!, locationPhoto:UIImage(systemName: "location.fill")! , WorkingHoursPhoto: UIImage(systemName: "clock")!, AppointmentPhoto: UIImage(systemName: "calendar")!, reviewPhoto: UIImage(systemName: "doc.text.fill")!, doctorN: "Dr.Ahmad", telePhoneNum: 0774584699, locationN: "Khalda", WorkingHoursLbl: "9-5", Appointmentlbl: "Book An Appointment", reviews: "leave a review"))
        
        arrClinics.append(Clinics.init(doctorPhoto: UIImage(systemName: "person")!, telephonePhoto: UIImage(systemName: "teletype")!, locationPhoto:UIImage(systemName: "location.fill")! , WorkingHoursPhoto: UIImage(systemName: "clock")!, AppointmentPhoto: UIImage(systemName: "calendar")!, reviewPhoto: UIImage(systemName: "doc.text.fill")!, doctorN: "Dr.Huda", telePhoneNum: 0799988662, locationN: "Wehdat", WorkingHoursLbl: "9-5", Appointmentlbl: "Book An Appointment", reviews: "leave a review"))



    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        return "Opthalmology Clinics"
    }

    /*func numberOfSections(in tableView: UITableView) -> Int {
        return arrSection.count */
      
      
      
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arrClinics.count
         }
         
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = ClinicaTableView.dequeueReusableCell(withIdentifier: "ClinicaCell", for: indexPath) as! ClinicsTableViewCellNew
            
      let data = arrClinics[indexPath.row]
      cell.setUpCell(firstImage: data.doctorPhoto, secondImage: data.telephonePhoto, thirdImage: data.locationPhoto, forthImage: data.WorkingHoursPhoto, fifthImage: data.AppointmentPhoto, sixthImage: data.reviewPhoto, doctorName1: data.doctorN, TelephoneNumber1: data.telePhoneNum, locationName1: data.locationN, WorkingHours: data.reviews, appointment: data.Appointmentlbl, review1: data.WorkingHoursLbl)
          
          /*let data = arrClinics[indexPath.row]
          cell.setUpCell(firstImage: data.doctorPhoto, secondImage: data.telephonePhoto, thirdImage: data.locationPhoto, forthImage: data.reviewPhoto, doctorName1: data.doctorN,                      TelephoneNumber1: data.telePhoneNum, locationName1: data.locationN, review1: data.reviews)*/
            
          
          return cell
         }
      
  /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          return arrSection[section]
      }*/
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            filterdData = ["\(arrClinics)"].filter({$0.contains(searchText)})
            ClinicaTableView.reloadData()
            
        }else{
            
          filterdData = ["\(arrClinics)"]
            ClinicaTableView.reloadData()
            
        }
    }
    
    
}

struct Clinics {
    let doctorPhoto         : UIImage
    let telephonePhoto      : UIImage
    let locationPhoto       : UIImage
    let WorkingHoursPhoto   : UIImage
    let AppointmentPhoto    : UIImage
    let reviewPhoto         : UIImage

    
    let doctorN         : String
    let telePhoneNum    : Int
    let locationN       : String
    let WorkingHoursLbl : String
    let Appointmentlbl  : String
    let reviews         : String
}

