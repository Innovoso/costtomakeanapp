//
//  MoreInfoViewController.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 30/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class MoreInfoViewController: UIViewController, CMPassThroughViewDelegate {
    
    @IBOutlet weak var moreInfoCard: UIView!
    @IBOutlet weak var moreInfoCardText: UILabel!
    @IBOutlet weak var screenOverlay: UIView!
    @IBOutlet weak var moreInfoLabel: UILabel!
    @IBOutlet weak var downArrow: UIImageView!
    
    var moreInfoCardAtBottom = true
    
    var screenSize: CGRect = UIScreen.mainScreen().bounds
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = view as? CMPassThroughView {
            view.delegate = self
        }
        screenOverlay.alpha = 0
        downArrow.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // =================================
    // MARK: - CMPassThroughViewDelegate
    // =================================
    
    func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        if CGRectContainsPoint(moreInfoCard.frame, point) {
            let p = moreInfoCard.convertPoint(point, fromView: nil)
            let view = moreInfoCard.hitTest(p, withEvent: event)
            return view
        } else if moreInfoCardAtBottom == false {
            let view = screenOverlay
            return view
        }

        return nil
    }
    
    
    // =============================
    // MORE INFO CARD TOUCH CONTROLS
    // =============================
    
    @IBAction func moreInfoButtonPressed(sender: UIButton) {
        if moreInfoCardAtBottom {
            moveMoreInfoCardUp()
        } else {
            moveMoreInfoCardDown()
        }
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
        moveMoreInfoCardDown()
    }
    
    
    // ================
    // HELPER FUNCTIONS
    // ================
    
    func moveMoreInfoCardUp(){
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.moreInfoCard.center = CGPoint(x: self.screenSize.width/2, y: self.screenSize.height - 200)
            self.screenOverlay.alpha = 0.5
            self.moreInfoLabel.hidden = true
            self.downArrow.hidden = false
            self.moreInfoCardAtBottom = false
            }, completion: nil)
    }
    
    func moveMoreInfoCardDown() {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.moreInfoCard.center = CGPoint(x: self.screenSize.width/2, y: self.screenSize.height + 85)
            self.screenOverlay.alpha = 0
            self.moreInfoLabel.hidden = false
            self.downArrow.hidden = true
            self.moreInfoCardAtBottom = true
            }, completion: nil)
    }
    
}
