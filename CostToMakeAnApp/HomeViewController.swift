//
//  ViewController.swift
//  CostToMakeAnApp
//
//  Created by Mark Cheng on 16/11/15.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, QuestionViewControllerDelegate {

    @IBOutlet weak var moreInfoButton: UILabel!
    @IBOutlet weak var moreInfoText: UILabel!
    @IBOutlet weak var screenOverlay: UIView!
    @IBOutlet weak var infoCard: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var totalCostLabel: UILabel!
    
    var screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.scrollEnabled = false
        OptionsManager.sharedInstance.totalCostLabel = totalCostLabel
    }
    
    // ============
    // START BUTTON
    // ============
    
    @IBAction func startAgainButtonTapped(sender: UIButton) {
        moveToNextQuestion(0)
        OptionsManager.sharedInstance.startAgainButtonTapped()
    }
    
    // ===============
    // COLLECTION VIEW
    // ===============
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Questions.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("homePageCell", forIndexPath: indexPath)
        if let cell = cell as? HomePageCell {
            cell.contentViewController.delegate = self
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? HomePageCell {
            cell.configure(indexPath.row)
            cell.addViewControllerToParentViewController(self)
            moreInfoText.text = Questions(rawValue: indexPath.row)?.infoCard
        }
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        // let otherCell = collectionView.dequeueReusableCellWithReuseIdentifier("homePageCell", forIndexPath: indexPath)
        
        if let cell = cell as? HomePageCell {
            cell.removeViewControllerFromParentViewController()
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSizeMake(width, height)
    }
    
    
    // =================================
    // QUESTION VIEW CONTROLLER DELEGATE
    // =================================

    func questionViewController(vc: QuestionViewController, didSelectItem: NSIndexPath) {
        if vc.questionNumber + 1 < Questions.count {
            moveToNextQuestion(vc.questionNumber + 1)
        } else {
            print("This is the last question")
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

    
    // =======
    // HELPERS
    // =======
    
    func moveToNextQuestion(questionNumber: Int) {
        let newIndex = NSIndexPath(forItem: questionNumber, inSection: 0)
        self.collectionView?.scrollToItemAtIndexPath(newIndex, atScrollPosition: UICollectionViewScrollPosition.Left, animated: true)
    }
}

