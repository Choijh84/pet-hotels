//
//  AppFonts.swift
//  ZappShopFinder
//
//  Created by Szabolcs Sztányi on 2014. 11. 24..
//  Copyright (c) 2014. Szabolcs Sztányi. All rights reserved.
//

import UIKit

/**
*  Customisation class to customise the fonts used in the app. Customise the fonts used in here to change the look of the app.
*/

extension UIFont {

    class func montSerratRegular() -> String {
        return "Montserrat-Regular"
    }
    
    class func avernirRegular() -> String {
        return "Avernir"
    }
    
    class func avernirNextRegular() -> String {
        return "Avernir Next"
    }

    class func helveticaRegular() -> String {
        return "Helvetica Neue"
    }

    // MARK: home view
    class func companyTitleFont() -> UIFont {
        return UIFont(name: avernirNextRegular(), size: 24.0)!
    }

    class func companyDetailTextFont() -> UIFont {
        return UIFont(name: avernirRegular(), size: 20.0)!
    }

    class func companyDescriptionFont() -> UIFont {
        return UIFont(name: helveticaRegular(), size: 12.0)!
    }

    class func hotelDetailActionButtonFont() -> UIFont {
        return UIFont(name: avernirRegular(), size: 12.0)!
    }
}
