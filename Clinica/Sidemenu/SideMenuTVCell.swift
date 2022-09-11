//
//  SideMenuTVCell.swift
//  Clinica
//
//  Created by htu on 07/09/2022.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class SideMenuTVCell: UITableViewCell {

    @IBOutlet weak var sideMenuImage: UIImageView!
    @IBOutlet weak var sideMenuLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
