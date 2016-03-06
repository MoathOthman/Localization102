//
//  MirroringViewController.swift
//  tesing ms
//
//  Created by Moath_Othman on 1/27/16.
//  Copyright © 2016 Moath_Othman. All rights reserved.
//

import UIKit
extension UIViewController {
    func loopThroughSubViewAndFlipTheImageIfItsAUIImageView(subviews: [UIView]) {
        if subviews.count > 0 {
            for subView in subviews {
                if subView.isKindOfClass(UIImageView.self) && subView.tag < 0 {
                    let toRightArrow = subView as! UIImageView
                    if let _img = toRightArrow.image {
                        toRightArrow.image = UIImage(CGImage: _img.CGImage!, scale:_img.scale , orientation: UIImageOrientation.UpMirrored)
                    }
                }
                loopThroughSubViewAndFlipTheImageIfItsAUIImageView(subView.subviews)
            }
        }
    }
}
class MirroringViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if L102Language.currentAppleLanguage() == "ar" {
            loopThroughSubViewAndFlipTheImageIfItsAUIImageView(self.view.subviews)
        }
        self.navigationItem
    }
}
