//
//  HotelFacilityServiceCollectionViewCell.swift
//  PetHotels-Swift
//
//  Created by Ken Choi on 2016. 12. 27..
//  Copyright © 2016년 Parse. All rights reserved.
//

import UIKit

class HotelFacilityServiceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var FaciltyServiceIcon: UIImageView!
    @IBOutlet weak var FaciltyServiceLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        FaciltyServiceIcon.image = nil
    }
    
    
}
