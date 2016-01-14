//
//  DriversManagerTabCell.swift
//  test
//
//  Created by System Administrator on 12.01.16.
//  Copyright (c) 2016 DIS. All rights reserved.
//

import UIKit

class DriversManagerTabCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var nameProfile: UILabel!
    @IBOutlet weak var techProfile: UILabel!
    @IBOutlet weak var numberProfile: UILabel!
    @IBOutlet weak var dateProfile: UILabel!
    @IBOutlet weak var adrProfile: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
