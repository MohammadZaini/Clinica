//
//  NerphologyTVCell.swift
//  Clinica
//
//  Created by htu on 12/09/2022.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class NerphologyTVCell: UITableViewCell {

  
    @IBOutlet weak var DoctorImage: UIImageView!
    
    @IBOutlet weak var TelephoneImage: UIImageView!
    
    @IBOutlet weak var LocationImage: UIImageView!
    
    @IBOutlet weak var WorkinghoursImage: UIImageView!
    
    @IBOutlet weak var AppointmentImage: UIImageView!
    
    @IBOutlet weak var ReviewImage: UIImageView!
    

    @IBOutlet weak var DoctorName: UILabel!
    
    
    @IBOutlet weak var TelephoneNumber: UILabel!
    
    @IBOutlet weak var Locationlabel: UILabel!
    
    @IBOutlet weak var WorkingHoursLabel: UILabel!
    
    @IBOutlet weak var AppointmentLabel: UILabel!
    
    @IBOutlet weak var Reviewlabel: UILabel!
    

    

    @IBOutlet weak var AppointmenButton: UIButton!
    
    @IBOutlet weak var ReviewButton: UIButton!
    
    
    

    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpCell(firstImage : UIImage , secondImage : UIImage , thirdImage : UIImage , ForthImage : UIImage , FifthImage : UIImage, SixthImage : UIImage , firstLabel : String , SecondLabel : Int , ThirdLabel : String, ForthLabel : String, FifthLabel : String, SixthLabel : String ) {
        
        DoctorImage.image       = firstImage
        TelephoneImage.image    = secondImage
        LocationImage.image     = thirdImage
        WorkinghoursImage.image = ForthImage
        AppointmentImage.image  = FifthImage
        ReviewImage.image       = SixthImage
        
        DoctorName.text        = firstLabel
        TelephoneNumber.text   = "\(SecondLabel)"
        Locationlabel.text     = ThirdLabel
        WorkingHoursLabel.text = ForthLabel
        AppointmentLabel.text  = FifthLabel
        Reviewlabel.text       = SixthLabel
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
