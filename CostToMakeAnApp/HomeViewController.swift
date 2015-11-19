//
//  ViewController.swift
//  CostToMakeAnApp
//
//  Created by Mark Cheng on 16/11/15.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

//class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
class HomeViewController: UIViewController {


    @IBOutlet weak var moreInfoButton: UILabel!
    @IBOutlet weak var moreInfoText: UILabel!
    @IBOutlet weak var screenOverlay: UIView!
    @IBOutlet weak var infoCard: UIView!
    
    var screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        moreInfoText.text = "Apple iOS is a better choice to reach a more engaged user base. Android has a broader reach, especially in emerging markets like Asia and Africa."
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // =========
    // INFO CARD
    // =========
    
    @IBAction func moreInfoButtonPressed(sender: UIButton) {
        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.infoCard.center = CGPoint(x: self.screenSize.width/2, y: self.screenSize.height - 200)
            self.screenOverlay.alpha = 0.5
            
            }, completion: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in (touches) {
            let location = touch.locationInView(self.view)

            if infoCard.frame.contains(location) {
                infoCard.center = location
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in (touches) {
            let location = touch.locationInView(self.view)
            
            if infoCard.frame.contains(location) {
                infoCard.center = location
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.infoCard.center = CGPoint(x: self.screenSize.width/2, y: self.screenSize.height + 100)
            self.screenOverlay.alpha = 0
            }, completion: nil)
    }

}

