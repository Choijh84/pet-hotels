//
//  RoomCollectionViewCell.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 26..
//  Copyright © 2016년 Parse. All rights reserved.
//

import UIKit

class RoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roomType: UILabel!
    @IBOutlet weak var roomImage: UIImageView!
    @IBOutlet weak var roomTerm: UILabel!
    @IBOutlet weak var roomPrice: UILabel!
    
    @IBOutlet weak var bookingButton: UIButton!
}
