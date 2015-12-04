//
//  ProjectSummaryCell.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 24/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

@objc protocol ProjectSummaryCellDelegate {
    func projectSummaryCellChangeButtonTapped(cell: ProjectSummaryCell)
}

class ProjectSummaryCell: UICollectionViewCell {
    
    @IBOutlet weak var answerIcon: UIImageView!
    @IBOutlet weak var answerDescription: UILabel!
    
    weak var delegate:ProjectSummaryCellDelegate?
    
    func configure(image: UIImage?, description: String?) {
        answerDescription.text = description
        answerIcon.image = image
    }
    
    @IBAction func changeButtonTapped(sender: AnyObject) {
        self.delegate?.projectSummaryCellChangeButtonTapped(self)
    }
    
}
