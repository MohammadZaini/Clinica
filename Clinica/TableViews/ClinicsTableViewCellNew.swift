//
//  ClinicsTableViewCellNew.swift
//  Clinica
//
//  Created by htu on 8/28/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ClinicsTableViewCellNew: UITableViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var locationImage: UIImageView!
    
    @IBOutlet weak var TelephoneImage: UIImageView!
    
    @IBOutlet weak var reviewsImage: UIImageView!
    
    @IBOutlet weak var workingHoursImage: UIImageView!
    
    @IBOutlet weak var appointmentImage: UIImageView!
    
    
    @IBOutlet weak var ClinicName: UILabel!
    
    @IBOutlet weak var doctorName: UILabel!
    
    @IBOutlet weak var telephoneNumber: UILabel!
    
    @IBOutlet weak var locationName: UILabel!
    	
    @IBOutlet weak var reviewsLabel: UILabel!
    
    @IBOutlet weak var AppointmentLabel: UILabel!
    
    @IBOutlet weak var workingHoursLabel: UILabel!
    
    @IBOutlet weak var addtoFavorite: UIButton!
    
    
    
    @IBAction func addToFavoriteTapped(_ sender: UIButton) {
        
        let ClinicN = ClinicName.text!
        let docName = doctorName.text!
        let TelePh = telephoneNumber.text!
        let loc = locationName.text!
        let workH = workingHoursLabel.text!
        let appoint = AppointmentLabel.text!
        let rev = reviewsLabel.text!
        
        let db = Firestore.firestore()
          
        
        db.collection("Favorite").addDocument(data: ["ClinicName": ClinicN ,"Doctor Name": docName, "Clinic Number": TelePh, "Clinic Location": loc, "Working Hours": workH, "Booking appointment": appoint, "Reviews": rev, "user_id" : Auth.auth().currentUser!.uid]) { error in
            
            //check for errors
            
            if error == nil {
                // No errors
               // self.test()
              
                
            }else{
                
                // Handle the error
                
               print("There is an error!!")
                
            }
            
            
            
        }
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(ClinicName1 : String ,doctorName1 : String , TelephoneNumber1 : String, locationName1 : String ,WorkingHours : String , appointment : String ,review1 :String){
        
        ClinicName.text        = ClinicName1
        doctorName.text        = doctorName1
        telephoneNumber.text   = TelephoneNumber1
        locationName.text      = locationName1
        workingHoursLabel.text = review1
        AppointmentLabel.text  = appointment
        reviewsLabel.text      = WorkingHours
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
