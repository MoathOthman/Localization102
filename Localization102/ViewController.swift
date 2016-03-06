//
//  ViewController.swift
//  Localization102
//
//  Created by Moath_Othman on 1/31/16.
//  Copyright © 2016 Moath_Othman. All rights reserved.
//

import UIKit

class ViewController: MirroringViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchLanguage(sender: UIButton) {
        if L102Language.currentAppleLanguage() == "en" {
            L102Language.setAppleLAnguageTo("ar")
//            UIView.appearance().semanticContentAttribute = .ForceRightToLeft
        } else {
            L102Language.setAppleLAnguageTo("en")
//            UIView.appearance().semanticContentAttribute = .ForceLeftToRight
        }
        let rootviewcontroller: UIWindow = ((UIApplication.sharedApplication().delegate?.window)!)!
        rootviewcontroller.rootViewController = self.storyboard?.instantiateViewControllerWithIdentifier("rootnav")
        let mainwindow = (UIApplication.sharedApplication().delegate?.window!)!
        mainwindow.backgroundColor = UIColor(hue: 0.6477, saturation: 0.6314, brightness: 0.6077, alpha: 0.8)
        UIView.transitionWithView(mainwindow, duration: 0.55001, options: .TransitionFlipFromLeft, animations: { () -> Void in
            }) { (Bool finished) -> Void in
                
        }

    }
    
}

