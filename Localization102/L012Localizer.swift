//
//  Localizer.swift
//  Localization102
//
//  Created by Moath_Othman on 2/24/16.
//  Copyright © 2016 Moath_Othman. All rights reserved.
//

import Foundation
import UIKit
extension UIApplication {
    class func isRTL() -> Bool{
        return UIApplication.sharedApplication().userInterfaceLayoutDirection == .RightToLeft
    }
}

class L102Localizer: NSObject {
    class func DoTheSwizzling() {
        MethodSwizzleGivenClassName(NSBundle.self, originalSelector: Selector("localizedStringForKey:value:table:"), overrideSelector: Selector("specialLocalizedStringForKey:value:table:"))
        MethodSwizzleGivenClassName(UIApplication.self, originalSelector: Selector("userInterfaceLayoutDirection"), overrideSelector: Selector("cstm_userInterfaceLayoutDirection"))
    }
}
extension UIApplication {
    var cstm_userInterfaceLayoutDirection : UIUserInterfaceLayoutDirection {
        get {
            var direction = UIUserInterfaceLayoutDirection.LeftToRight
            if L102Language.currentAppleLanguage() == "ar" {
                direction = .RightToLeft
            }
            return direction
        }
    }
}
extension NSBundle {
     func specialLocalizedStringForKey(key: String, value: String?, table tableName: String?) -> String {
        let currentLanguage = L102Language.currentAppleLanguage()
        var bundle = NSBundle();
        if let _path = NSBundle.mainBundle().pathForResource(currentLanguage, ofType: "lproj") {
             bundle = NSBundle(path: _path)!
        } else {
            let _path = NSBundle.mainBundle().pathForResource("Base", ofType: "lproj")!
            bundle = NSBundle(path: _path)!
        }
        return (bundle.specialLocalizedStringForKey(key, value: value, table: tableName))
    }
}
/// Exchange the implementation of two methods for the same Class
func MethodSwizzleGivenClassName(cls: AnyClass, originalSelector: Selector, overrideSelector: Selector) {
    let origMethod: Method = class_getInstanceMethod(cls, originalSelector);
    let overrideMethod: Method = class_getInstanceMethod(cls, overrideSelector);
    if (class_addMethod(cls, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
        class_replaceMethod(cls, overrideSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, overrideMethod);
    }
}
