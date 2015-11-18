//
//  ViewController.swift
//  CostToMakeAnApp
//
//  Created by Mark Cheng on 16/11/15.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var moreInfoButton: UILabel!
    @IBOutlet weak var moreInfoText: UILabel!
    @IBOutlet weak var screenOverlay: UIView!
    @IBOutlet weak var infoCard: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let descriptions = ["Android", "Apple iOS", "Android and Apple iOS"]
    let images = [UIImage(named: "Android"), UIImage(named: "iOS"), UIImage(named: "iOS and Android")]
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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) as? AnswerCardCell {
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                cell.backgroundColor = UIColor(red: 233/255, green: 105/255, blue: 105/255, alpha: 1.0)
                }, completion: nil)
        }
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

