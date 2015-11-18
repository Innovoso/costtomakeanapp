//
//  SecondViewController.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 17/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, InnerSlideViewController {
    
    @IBOutlet weak var moreInfoButton: UILabel!
    @IBOutlet weak var moreInfoText: UILabel!
    @IBOutlet weak var screenOverlay: UIView!
    @IBOutlet weak var infoCard: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let descriptions = ["Email", "Social", "None", "I don't know"]
    let images = [UIImage(named: "Email"), UIImage(named: "Social"), UIImage(named: "None"), UIImage(named: "?")]
    var screenSize: CGRect = UIScreen.mainScreen().bounds
    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        moreInfoText.text = "An email login is generally best to start with unless your app will have tight integration with services like Facebook or Twitter, in which case social login is better."
        self.transitioningDelegate = self.transitionManager

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startAgainButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
    
    // ================
    // COLLECTION VIEWS
    // ================
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return descriptions.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("answerCard", forIndexPath: indexPath)
        
        if let cell = cell as? AnswerCardCell {
            let description = descriptions[indexPath.row]
            let image = images[indexPath.row]
            cell.configure(description, image: image)
            cell.layer.shadowColor = UIColor.blackColor().CGColor
            cell.layer.shadowOffset = CGSizeMake(0, 2)
            cell.layer.shadowRadius = 2
            cell.layer.shadowOpacity = 0.8
        }
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 20
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
            //                        self.moreInfoButton.setTitle("Hide", forState: UIControlState.Normal)
            self.infoCard.center = CGPoint(x: self.screenSize.width/2, y: self.screenSize.height + 100)
            self.screenOverlay.alpha = 0
            }, completion: nil)
    }
    
    
    // ==============================
    // TRANSITION MANAGER DATA SOURCE
    // ==============================
    
    func viewsToSlide() -> [UIView] {
        return [collectionView, infoCard]
    }
    
}
