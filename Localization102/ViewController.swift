//
//  ViewController.swift
//  Localization102
//
//  Created by Moath_Othman on 1/31/16.
//  Copyright © 2016 Moath_Othman. All rights reserved.
//

import UIKit

class ViewController: MirroringViewController {
    @IBOutlet weak var programmaticallylocalizedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.programmaticallylocalizedLabel.text = NSLocalizedString("localize me please", comment: "Localize me Label in the main scene")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchTheLanguage(_ sender: UIButton) {
        var transition: UIViewAnimationOptions = .transitionFlipFromLeft
        if L102Language.currentAppleLanguage() == "en" {
            L102Language.setAppleLAnguageTo(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            L102Language.setAppleLAnguageTo(lang: "en")
            transition = .transitionFlipFromRight
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        rootviewcontroller.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "rootnav")
        let mainwindow = (UIApplication.shared.delegate?.window!)!
        mainwindow.backgroundColor = UIColor(hue: 0.6477, saturation: 0.6314, brightness: 0.6077, alpha: 0.8)
        UIView.transition(with: mainwindow, duration: 0.55001, options: transition, animations: { () -> Void in
        }) { (finished) -> Void in
            
        }
    }
 
    @IBAction func didEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func end(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
}

