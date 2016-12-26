//
//  HotelReferenceInfo.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 26..
//  Copyright © 2016년 Parse. All rights reserved.
//

import Foundation
import UIKit

class HotelReferenceInfo: NSObject {
    var totalRoomNumber: Int!
    var checkInAvailableTime: String!
    var hotel: Hotel!
    
    var pickupFee: String?
    var parkingFee: String?
    
    init(totalRoomNumber: Int, checkInAvailableTime: String, hotel: Hotel) {
        self.totalRoomNumber = totalRoomNumber
        self.checkInAvailableTime = checkInAvailableTime
        self.hotel = hotel
    }
    
}
