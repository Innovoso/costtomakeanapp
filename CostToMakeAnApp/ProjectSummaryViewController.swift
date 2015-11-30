//
//  ProjectSummaryViewController.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 23/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class ProjectSummaryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            cell.layer.shadowColor = UIColor.blackColor().CGColor
            cell.layer.shadowOffset = CGSizeMake(0, 2)
            cell.layer.shadowRadius = 2
            cell.layer.shadowOpacity = 0.8
        }
        
        return cell
    }
    
    
    // ===========
    // BUTTON TAPS
    // ===========
    
    @IBAction func startAgainButtonTapped(sender: UIButton) {    
    }
    
    @IBAction func startProjectWithUsButtonTapped(sender: UIButton) {
    }

}
