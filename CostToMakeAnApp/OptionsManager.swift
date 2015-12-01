//
//  PriceCalculator.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 23/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import Foundation
import UIKit

class OptionsManager {
    
    static let sharedInstance = OptionsManager()
    var answerArray = Array<Int>()
    var totalPrice = Int()
    var totalCostLabel: UILabel!
    
    init() {
    }
    
    func addToPrice(itemToBeAdded:Int) {
        answerArray.append(itemToBeAdded)
        totalPrice = answerArray.count * 5000
        totalCostLabel.text = "$\(totalPrice)"
    }
    
    func startAgainButtonTapped() {
        answerArray = []
        totalCostLabel.text = "$0"
    }
    
    func showTotalPrice(){
        totalCostLabel.text = "$\(totalPrice)"
    }
    
}