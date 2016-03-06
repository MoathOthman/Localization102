//
//  MirroringLabel.swift
//  Localization102
//
//  Created by Moath_Othman on 3/6/16.
//  Copyright © 2016 Moath_Othman. All rights reserved.
//

import UIKit

class MirroringLabel: UILabel {
    override func layoutSubviews() {
        if self.tag < 0 {
            if UIApplication.isRTL()  {
                if self.textAlignment == .Right {
                    return
                }
            } else {
                if self.textAlignment == .Left {
                    return
                }
            }
        }
        if self.tag < 0 {
            if UIApplication.isRTL()  {
                self.textAlignment = .Right
            } else {
                self.textAlignment = .Left
            }
        }
    }

}
