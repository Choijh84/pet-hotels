//
//  ExtensionDistanceHelper.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 29..
//  Copyright © 2016년 Parse. All rights reserved.
//

import UIKit

/// NSString extension to have the extra NSString formatting in a central place

extension NSString {
    /*
     
     Credit for this solution:
     http://stackoverflow.com/questions/2324125/objective-c-string-formatter-for-distances
     
     */
    
    /**
     Returns a string with the right formatting.
     
     :param: distanceValue the distance the distance value to use, to create the string
     :return: NSString - distance string with the right formatting according to the user's locale settings
     */
    class func distanceStringWithValue(_ distanceValue: Double) -> NSString {
        
        var distance = distanceValue
        
        var format: NSString = ""
        let isMetric = (Locale.current as NSLocale).object(forKey: NSLocale.Key.usesMetricSystem) as! Bool
        if isMetric
        {
            if distance < 1000 {
                format = "m"
            } else {
                format = "km"
                distance /= 1000
            }
        }
        else
        {
            distance *= 3.2808399
            if distance < 3281 {
                format = "ft"
            }
            else {
                format = "mi"
                distance /= 5280
            }
        }
        
        let distanceString = stringFromDistanceValue(distance)
        return ("\(distanceString)" + " " + "\(format)") as NSString
    }
    
    /**
     Return a string of a number to one decimal place and with commas & periods based on the locale.
     
     :param: doubleValue the distance that needs to be converted
     
     :return: NSString - the converted string
     */
    fileprivate class func stringFromDistanceValue(_ doubleValue: Double) -> NSString {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale.current
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 1
        return numberFormatter.string(from: NSNumber(value: doubleValue as Double))! as NSString
    }
}

