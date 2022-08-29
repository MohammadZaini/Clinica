//
//  ClinicsCollectionViewCell.swift
//  Clinica
//
//  Created by HTU on 8/24/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class ClinicsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ClinicImage: UIImageView!
    
    @IBOutlet weak var ClinicName: UILabel!
    
    func setUpCell(photo: UIImage,name : String) {
        
        
        ClinicImage.layer.cornerRadius = ClinicImage.frame.size.width / 2
        ClinicImage.clipsToBounds = true
        ClinicImage.image = photo
        ClinicName.text = name 
    
    }
    
}
