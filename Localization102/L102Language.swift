//
//  L102Language.swift
//  Localization102
//
//  Created by Moath_Othman on 2/24/16.
//  Copyright © 2016 Moath_Othman. All rights reserved.
//

import UIKit

// constants
let APPLE_LANGUAGE_KEY = "AppleLanguages"
/// L102Language
class L102Language {
    /// get current Apple language
    class func currentAppleLanguage() -> String{
        let userdef = NSUserDefaults.standardUserDefaults()
        let langArray = userdef.objectForKey(APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        let currentWithoutLocale = current.substringToIndex(current.startIndex.advancedBy(2))
        return currentWithoutLocale
    }
    /// set @lang to be the first in Applelanguages list
    class func setAppleLAnguageTo(lang: String) {
        let userdef = NSUserDefaults.standardUserDefaults()
        userdef.setObject([lang,currentAppleLanguage()], forKey: APPLE_LANGUAGE_KEY)
        userdef.synchronize()
    }

}
