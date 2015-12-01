//
//  ViewController.swift
//  CostToMakeAnApp
//
//  Created by Mark Cheng on 16/11/15.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, QuestionViewControllerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var totalCostLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.scrollEnabled = false
        OptionsManager.sharedInstance.totalCostLabel = totalCostLabel
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let moreInfoCardVC = storyboard.instantiateViewControllerWithIdentifier("MoreInfoViewController") as! MoreInfoViewController
    
        addChildViewController(moreInfoCardVC)
        self.view.addSubview(moreInfoCardVC.view)
        moreInfoCardVC.view.frame = self.view.bounds
        moreInfoCardVC.didMoveToParentViewController(self)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
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
        collectionView.backgroundColor = Questions(rawValue: indexPath.row)?.backgroundColour
        self.view.backgroundColor = Questions(rawValue: indexPath.row)?.backgroundColour

        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? HomePageCell {
            cell.configure(indexPath.row)
            cell.addViewControllerToParentViewController(self)
//            moreInfoText.text = Questions(rawValue: indexPath.row)?.infoCard
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
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let projectSummaryViewController = storyBoard.instantiateViewControllerWithIdentifier("ProjectSummaryViewController") as! ProjectSummaryViewController
            presentViewController(projectSummaryViewController, animated: true, completion: nil)
        }
    }

    
    // =======
    // HELPERS
    // =======
    
    func moveToNextQuestion(questionNumber: Int) {
        let newIndex = NSIndexPath(forItem: questionNumber, inSection: 0)
        self.collectionView?.scrollToItemAtIndexPath(newIndex, atScrollPosition: UICollectionViewScrollPosition.Left, animated: true)
    }
}

