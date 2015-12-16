//
//  AnswerCardCell.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 16/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class AnswerCardCell: UICollectionViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    func configure(description: String?, image:UIImage?) {
        descriptionLabel.text = description
        cardImage.image = image
    }    
}
