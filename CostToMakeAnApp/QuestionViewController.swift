//
//  SecondViewController.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 17/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

@objc protocol QuestionViewControllerDelegate {
    func questionViewController(vc:QuestionViewController, didSelectItem:NSIndexPath)
}

class QuestionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var questionNumber = 0
    var screenSize: CGRect = UIScreen.mainScreen().bounds
    weak var delegate:QuestionViewControllerDelegate?
    
    
    // ====
    // INIT
    // ====
    
    class func loadFromNib(questionNumber:Int) -> QuestionViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("QuestionViewController") as! QuestionViewController
        return vc
    }
    
    
    // =========
    // LIFECYCLE
    // =========
    
    override func viewDidAppear(animated: Bool) {
        questionLabel.text = Questions(rawValue: questionNumber)?.title
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        Helper.delay(0.01) { () -> () in
            self.questionLabel.text = Questions(rawValue: self.questionNumber)?.title
        }
    }
    
    
    // ================
    // COLLECTION VIEWS
    // ================
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (Questions(rawValue: questionNumber)?.descriptions.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("answerCard", forIndexPath: indexPath)
        
        if let cell = cell as? AnswerCardCell {
            let description = Questions(rawValue: questionNumber)?.descriptions[indexPath.row]
            let image = Questions(rawValue: questionNumber)?.images[indexPath.row]
            cell.configure(description, image: image)
            cell.layer.shadowColor = UIColor.blackColor().CGColor
            cell.layer.shadowOffset = CGSizeMake(0, 2)
            cell.layer.shadowRadius = 2
            cell.layer.shadowOpacity = 0.8
            cell.backgroundColor = Questions(rawValue: questionNumber)?.cellColour
        }

        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) as? AnswerCardCell {
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                cell.backgroundColor = UIColor(red: 233/255, green: 105/255, blue: 105/255, alpha: 1.0)
                OptionsManager.sharedInstance.calculatePrice(indexPath.row)
                self.delegate?.questionViewController(self, didSelectItem: indexPath)
                
                }, completion: { finished in
                self.delegate?.questionViewController(self, didSelectItem: indexPath)
                    
            })
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.bounds.width, 117)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 60, 0)
    }
    
}
