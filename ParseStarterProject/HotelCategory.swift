//
//  HotelCategory.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 29..
//  Copyright © 2016년 Parse. All rights reserved.
//

import Foundation

/// The category object for the Stores

class HotelCategory: NSObject {
    
    /// name of the category(example: pet hotel, pet cafe, pet shop and etc.)
    var name: String?
    /// ID of the category
    var objectId: String?
    
    /**
     Checks if the 2 objects have the same objectId, if so, they are equal
     
     - parameter object: object to compare self with
     
     - returns: true if their objectId is equal
     */
    override func isEqual(_ object: Any?) -> Bool {
        if let rhs = object as? HotelCategory {
            return objectId == rhs.objectId
        }
        return false
    }
    
}
