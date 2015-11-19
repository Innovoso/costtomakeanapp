//
//  SecondViewController.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 17/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let descriptions = ["Email", "Social", "None", "I don't know"]
    let images = [UIImage(named: "Email"), UIImage(named: "Social"), UIImage(named: "None"), UIImage(named: "?")]
    var screenSize: CGRect = UIScreen.mainScreen().bounds
    
    // ====
    // INIT
    // ====
    
    class func loadFromNib() -> QuestionViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("QuestionViewController") as! QuestionViewController
        return vc
    }
    
    
    // =========
    // LIFECYCLE
    // =========
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
}
