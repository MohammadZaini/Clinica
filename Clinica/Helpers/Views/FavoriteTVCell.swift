//
//  FavoriteTVCell.swift
//  Clinica
//
//  Created by htu on 15/09/2022.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class FavoriteTVCell: UITableViewCell {

    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var telephoneImage: UIImageView!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var workingHoursImage: UIImageView!
    @IBOutlet weak var appointmentImage: UIImageView!
    @IBOutlet weak var reviewImage: UIImageView!
    
    
    @IBOutlet weak var ClinicName: UILabel!
    @IBOutlet weak var doctorLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var workingHoursLabel: UILabel!
    @IBOutlet weak var appointmentLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    
    
    /*var img1 = UIImage()
    var img2 = UIImage()
    var img3 = UIImage()
    var img4 = UIImage()
    var img5 = UIImage()
    var img6 = UIImage()
    
    var label1 = ""
    var label2 = ""
    var label3 = ""
    var label4 = ""
    var label5 = ""
    var label6 = ""*/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       /* doctorImage.image       = img1
        telephoneImage.image    = img2
        locationImage.image     = img3
        workingHoursImage.image = img4
        appointmentImage.image  = img5
        reviewImage.image       = img6
        
        doctorLabel.text        = label1
        telephoneLabel.text     = label2
        locationLabel.text      = label3
        workingHoursLabel.text  = label4
        appointmentLabel.text   = label5
        reviewLabel.text        = label6*/
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(  ClinicName1 : String ,doctorName1 : String , TelephoneNumber1 : String, locationName1 : String ,WorkingHours : String , appointment : String ,review1 :String){
        
        ClinicName.text         = ClinicName1
        doctorLabel.text        = doctorName1
        telephoneLabel.text     = TelephoneNumber1
        locationLabel.text      = locationName1
        workingHoursLabel.text  = review1
        appointmentLabel.text   = appointment
        reviewLabel.text        = WorkingHours
        
        
        
        
    }

}
