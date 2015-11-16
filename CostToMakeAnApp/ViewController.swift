//
//  ViewController.swift
//  CostToMakeAnApp
//
//  Created by Mark Cheng on 16/11/15.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    let descriptions = ["Android", "Apple iOS", "Android and Apple iOS"]
    let images = [UIImage(named: "Android"), UIImage(named: "iOS"), UIImage(named: "iOS and Android")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return descriptions.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("answerCard", forIndexPath: indexPath)
        
        if let cell = cell as? AnswerCardCell {
            let description = descriptions[indexPath.row]
            let image = images[indexPath.row]
            cell.configure(description, image: image)
        }
        
        
        return cell
    
    }

}

