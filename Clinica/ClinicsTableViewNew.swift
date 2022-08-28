//
//  ClinicsTableViewNew.swift
//  Clinica
//
//  Created by htu on 8/28/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class ClinicsTableViewNew: UIViewController, UITableViewDelegate , UITableViewDataSource {
   
     var arrClinics = [Clinics]()
 
    @IBOutlet weak var ClinicaTableView: UITableView!
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrClinics.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ClinicaTableView.dequeueReusableCell(withIdentifier: "ClinicaCell", for: indexPath) as! ClinicsTableViewCellNew
        
        let data = arrClinics[indexPath.row]
        cell.setUpCell(firstImage: data.doctorPhoto, secondImage: data.telephonePhoto, thirdImage: data.locationPhoto, forthImage: data.reviewPhoto, doctorName1: data.doctorN, TelephoneNumber1: data.telePhoneNum, locationName1: data.locationN, review1: data.reviews)
        
        return cell
       }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ClinicaTableView.delegate = self
        ClinicaTableView.dataSource = self
        arrClinics.append(Clinics.init(doctorPhoto: UIImage(systemName: "person")!, telephonePhoto: UIImage(systemName: "teletype")!, locationPhoto: UIImage(systemName: "location.fill" )!, reviewPhoto: UIImage(systemName: "doc.text.fill")!, doctorN: "Dr.Ahmad", telePhoneNum: 0775148625, locationN: "KHalda", reviews: "Reviews"))

    }
    

}

struct Clinics {
    let doctorPhoto : UIImage
    let telephonePhoto : UIImage
    let locationPhoto : UIImage
    let reviewPhoto : UIImage

    let doctorN : String
    let telePhoneNum : Int
    let locationN : String
    let reviews : String
}
