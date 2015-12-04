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
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
    
    var moreInfoCardViewController:MoreInfoViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.scrollEnabled = false
        OptionsManager.sharedInstance.totalPriceLabel = totalPriceLabel
        instantiateChildVC()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.progressBar.frame = CGRectMake(0, 0, self.view.frame.width/8, 6)
            }, completion: nil)
    }
    
    
    // ====================================
    // INSTANTIATE MORE INFO VC AS CHILD VC
    // ====================================
    
    func instantiateChildVC(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let moreInfoCardVC = storyboard.instantiateViewControllerWithIdentifier("MoreInfoViewController") as! MoreInfoViewController
        
        addChildViewController(moreInfoCardVC)
        self.view.addSubview(moreInfoCardVC.view)
        moreInfoCardVC.view.frame = self.view.bounds
        moreInfoCardVC.didMoveToParentViewController(self)
        moreInfoCardViewController = moreInfoCardVC
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
        moreInfoCardViewController.moreInfoCard.backgroundColor = Questions(rawValue: indexPath.row)?.moreInfoCardColour
        moreInfoCardViewController.moreInfoCardText.text = Questions(rawValue: indexPath.row)?.infoCard
        
        OptionsManager.sharedInstance.returnQuestionNumber(indexPath.row)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? HomePageCell {
            cell.configure(indexPath.row)
            cell.addViewControllerToParentViewController(self)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {        
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
            
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                let percentageProgress = CGFloat(1.0-(6.0 - Double(vc.questionNumber))/8.0)
                self.progressBar.frame = CGRectMake(0, 0, self.view.frame.width*percentageProgress, 6)
                self.progressBar.backgroundColor = Questions(rawValue: vc.questionNumber)?.progressBarColour
                }, completion: nil)

        } else {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let projectSummaryViewController = storyBoard.instantiateViewControllerWithIdentifier("ProjectSummaryViewController") as! ProjectSummaryViewController
            presentViewController(projectSummaryViewController, animated: true, completion: { () -> Void in
//                self.moveToNextQuestion(0)
            })
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

