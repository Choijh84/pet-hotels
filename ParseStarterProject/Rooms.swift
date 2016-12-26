//
//  Rooms.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 26..
//  Copyright © 2016년 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Rooms: NSObject {
    
    var roomType: String!
    var roomPrice: Int!
    var roomHotel: Hotel!
    
    var roomDetails: String?
    var roomTerm: String?
    var roomPhotos: UIImage?
    
    override init() {
        roomType = ""
        roomPrice = 100
        roomHotel = Hotel()
    }
    
    init(roomType: String, roomPrice: Int, roomHotel: Hotel) {
        self.roomType = roomType
        self.roomPrice = roomPrice
        self.roomHotel = roomHotel
    }
    
    init(roomType: String, roomPrice: Int, roomHotel: Hotel, roomDetails: String, roomTerm: String, roomPhoto: UIImage) {
        self.roomType = roomType
        self.roomPrice = roomPrice
        self.roomHotel = roomHotel
        
        self.roomDetails = roomDetails
        self.roomTerm = roomTerm
        self.roomPhotos = roomPhoto
    }
    
    init(obj: PFObject) {
        self.roomType = obj.value(forKey: "roomType") as! String
        self.roomPrice = obj.value(forKey: "roomPrice") as! Int
        // self.roomHotel = obj.value(forKey: "roomHotel") as! Hotel
        
        self.roomDetails = obj.value(forKey: "roomDetails") as? String
        self.roomTerm = obj.value(forKey: "roomTerm") as? String
        let tfile = obj.value(forKey: "roomPhotos") as! PFFile
        do {
            let timage = try tfile.getData()
            self.roomPhotos = UIImage(data: timage)
        } catch {
            print("Error in room photo of hotel")
        }
    }
}


