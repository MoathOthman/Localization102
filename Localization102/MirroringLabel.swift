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
                if self.textAlignment == .right {
                    return
                }
            } else {
                if self.textAlignment == .left {
                    return
                }
            }
        }
        if self.tag < 0 {
            if UIApplication.isRTL()  {
                self.textAlignment = .right
            } else {
                self.textAlignment = .left
            }
        }
    }

}
