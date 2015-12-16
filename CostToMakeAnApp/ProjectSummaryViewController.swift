//
//  ProjectSummaryViewController.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 23/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

@objc protocol ProjectSummaryDelegate {
    func projectSummaryChangeButtonTapped(cellToMoveTo: Int)
}

class ProjectSummaryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ProjectSummaryCellDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var yourAppEstimateLabel: UILabel!
    @IBOutlet weak var startAgainButton: UIButton!
    @IBOutlet weak var totalPriceLabelWidthConstraint: NSLayoutConstraint!
    
    weak var delegate:ProjectSummaryDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        OptionsManager.sharedInstance.totalPriceLabel = totalPriceLabel
        OptionsManager.sharedInstance.calculatePrice(nil)
        self.collectionView.showsVerticalScrollIndicator = false
        setAnchorPoint(CGPoint(x: CGFloat(0.5), y: CGFloat(1)), forView: totalPriceLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let percentageChange = min(max(0,scrollView.contentOffset.y / 100), 1)
        
        let minHeight:CGFloat = 57
        let viewHeightChange = 100 * (1 - percentageChange)
        headerViewHeightContraint.constant = minHeight + viewHeightChange
        
        yourAppEstimateLabel.alpha = CGFloat(1 - min(percentageChange * 2, 1))
        startAgainButton.alpha = CGFloat(1 - min(percentageChange * 2, 1))
        
        totalPriceLabel.transform = CGAffineTransformMakeScale(max(0.5, 1 - percentageChange/2), max(0.5,1 - percentageChange/2))
    }

    
    // ===============
    // COLLECTION VIEW
    // ===============
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Questions.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("summaryAnswer", forIndexPath: indexPath)
        
        if let cell = cell as? ProjectSummaryCell {
            let selectedAnswer = OptionsManager.sharedInstance.answerArray[indexPath.row]
            let description = Questions(rawValue: indexPath.row)?.summaryDescriptions[selectedAnswer]
            let image = Questions(rawValue: indexPath.row)?.images[selectedAnswer]
            cell.configure(image, description: description)
            cell.delegate = self
            cell.layer.shadowColor = UIColor.blackColor().CGColor
            cell.layer.shadowOffset = CGSizeMake(0, 2)
            cell.layer.shadowRadius = 2
            cell.layer.shadowOpacity = 0.8
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.bounds.width, 89)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(120, 0, 0, 0)
    }
    
    
    // =============================
    // PROJECT SUMMARY CELL DELEGATE
    // =============================
    
    func projectSummaryCellChangeButtonTapped(cell: ProjectSummaryCell) {
        let cellNumber = Int(collectionView.indexPathForCell(cell)!.row)
        OptionsManager.sharedInstance.changeButtonTapped(cellNumber)
        
        self.delegate?.projectSummaryChangeButtonTapped(cellNumber)

        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    // ===========
    // BUTTON TAPS
    // ===========
    
    
    @IBAction func startAgainButtonTapped(sender: UIButton) {
        OptionsManager.sharedInstance.startAgainButtonTapped()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func startProjectWithUsButtonTapped(sender: UIButton) {
    }

}


extension ProjectSummaryViewController {
    
    func setAnchorPoint(anchorPoint: CGPoint, forView view: UIView) {
        var newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y)
        
        newPoint = CGPointApplyAffineTransform(newPoint, view.transform)
        oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform)
        
        var position = view.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        view.layer.position = position
        view.layer.anchorPoint = anchorPoint
    }

}
