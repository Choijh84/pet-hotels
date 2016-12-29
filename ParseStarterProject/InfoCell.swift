//
//  InfoCell.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 29..
//  Copyright © 2016년 Parse. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet weak var hotelInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        hotelInfoLabel.text = "Hotel Information"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
