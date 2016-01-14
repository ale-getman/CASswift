//
//  OrderManagerTabCell.swift
//  test
//
//  Created by System Administrator on 12.01.16.
//  Copyright (c) 2016 DIS. All rights reserved.
//

import UIKit

class OrderManagerTabCell: UITableViewCell {

    @IBOutlet weak var imgStatus: UIImageView!
    @IBOutlet weak var nameOrder: UILabel!
    @IBOutlet weak var techOrder: UILabel!
    @IBOutlet weak var whoOrder: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
