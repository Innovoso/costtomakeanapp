//
//  MoreInfoViewController.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 30/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet weak var moreInfoCard: UIView!
    
    var screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        view.userInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // =============================
    // MORE INFO CARD TOUCH CONTROLS
    // =============================
    
    @IBAction func moreInfoButtonPressed(sender: UIButton) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.moreInfoCard.center = CGPoint(x: self.screenSize.width/2, y: self.screenSize.height - 200)
//            self.screenOverlay.alpha = 0.5
            
            }, completion: nil)
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in (touches) {
            let location = touch.locationInView(self.view)
            
            if moreInfoCard.frame.contains(location) {
                moreInfoCard.center = location
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in (touches) {
            let location = touch.locationInView(self.view)
            
            if moreInfoCard.frame.contains(location) {
                moreInfoCard.center = location
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.moreInfoCard.center = CGPoint(x: self.screenSize.width/2, y: self.screenSize.height + 60)
//            self.screenOverlay.alpha = 0
            }, completion: nil)
    }

}
