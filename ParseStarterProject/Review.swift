//
//  Review.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 29..
//  Copyright © 2016년 Parse. All rights reserved.
//

import UIKit
import Parse

// Review object that contains all the properties of a Hotel's review

class Review: NSObject {
    
    var objectId: String?
    // body of the review
    var text: String?
    // rating of the review
    var rating: NSNumber!
    // Creator of the review
    var creator: PFUser?
    // Image Url of the review
    var fileURL: String?
    
    // 향후 리뷰에 사진이 여러개가 되어야 할 수도 있음
}
