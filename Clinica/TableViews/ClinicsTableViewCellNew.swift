//
//  ClinicsTableViewCellNew.swift
//  Clinica
//
//  Created by htu on 8/28/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class ClinicsTableViewCellNew: UITableViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var locationImage: UIImageView!
    
    @IBOutlet weak var TelephoneImage: UIImageView!
    
    @IBOutlet weak var reviewsImage: UIImageView!
    
    @IBOutlet weak var workingHoursImage: UIImageView!
    
    @IBOutlet weak var appointmentImage: UIImageView!
    
    
    
    @IBOutlet weak var doctorName: UILabel!
    
    @IBOutlet weak var telephoneNumber: UILabel!
    
    @IBOutlet weak var locationName: UILabel!
    	
    @IBOutlet weak var reviewsLabel: UILabel!
    
    @IBOutlet weak var AppointmentLabel: UILabel!
    
    @IBOutlet weak var workingHoursLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(firstImage : UIImage , secondImage : UIImage , thirdImage : UIImage,
                   forthImage : UIImage , fifthImage :UIImage , sixthImage :UIImage,
                   
                   doctorName1 : String , TelephoneNumber1 : Int,
                   locationName1 : String ,WorkingHours : String , appointment : String ,review1 :String){
        
        personImage.image       = firstImage
        locationImage.image     = secondImage
        TelephoneImage.image    = thirdImage
        workingHoursImage.image = forthImage
        appointmentImage.image  = fifthImage
        reviewsImage.image      = sixthImage
       
        
        doctorName.text        = doctorName1
        telephoneNumber.text   = "\(TelephoneNumber1)"
        locationName.text      = locationName1
        reviewsLabel.text      = review1
        AppointmentLabel.text  = appointment
        workingHoursLabel.text = WorkingHours
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
