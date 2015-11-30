//
//  ProjectSummaryCell.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 24/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class ProjectSummaryCell: UICollectionViewCell {
    
    @IBOutlet weak var answerIcon: UIImageView!
    @IBOutlet weak var answerDescription: UILabel!
    
    func configure(image: UIImage?, description: String?) {
        answerDescription.text = description
        answerIcon.image = image
    }
}
