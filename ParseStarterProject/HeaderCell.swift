//
//  HeaderCell.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 26..
//  Copyright © 2016년 Parse. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    // 향후에는 이미지 배열로 변경 필요
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var hotelName: UILabel!
    
    @IBOutlet weak var hotelAddress: UILabel!
    
    @IBOutlet weak var hotelPrice: UILabel!

}
