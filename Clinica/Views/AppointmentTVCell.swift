//
//  AppointmentTVCell.swift
//  Clinica
//
//  Created by htu on 12/09/2022.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class AppointmentTVCell: UITableViewCell {

    @IBOutlet weak var AppointmentIcon: UIImageView!
    @IBOutlet weak var TheAppointment: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    
    func setUpCell(AppointImg : UIImage , theAppoint : String){
        
        AppointmentIcon.image = AppointImg
        TheAppointment.text = theAppoint
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
