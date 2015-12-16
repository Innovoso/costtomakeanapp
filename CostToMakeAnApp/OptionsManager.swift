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
    var answerArray = [-1,-1,-1,-1,-1,-1,-1,-1]
    var currentQuestionNumber = 0
    var runningPrice = Int()
    var totalPrice = Int()
    var totalPriceLabel: UILabel!
    var numberOfApps = 1
    var numberOfPages = 0
    var typeOfDesign = "Unknown"
    var moveToPageNumber = 0
    var summaryPageReached = false
    var moreInfoCardAppeared = false
    
    init() {
    }
    
    func returnQuestionNumber(questionNumber:Int){
        currentQuestionNumber = questionNumber
    }
    
    func calculatePrice(itemToBeAdded:Int?) {
        runningPrice = 0
        numberOfApps = 1
        numberOfPages = 0
        
        if (itemToBeAdded != nil) {
            answerArray[currentQuestionNumber] = itemToBeAdded!
        }
        
        if answerArray[0] > -1 {
            switch Questions(rawValue: 0)!.descriptions[answerArray[0]] {
            case "Android":
                runningPrice += 10000
                numberOfApps = 1
            case "Apple iOS":
                runningPrice += 8000
                numberOfApps = 1
            case "Android and Apple iOS":
                runningPrice += 9000
                numberOfApps = 2
            default:
                break
            }
        }
        
        if answerArray[1] > -1 {
            switch Questions(rawValue: 1)!.descriptions[answerArray[1]] {
            case "Email":
                runningPrice += 2000
                numberOfPages += 3
            case "Social":
                runningPrice += 4000
                numberOfPages += 2
            default:
                break
            }
        }
        
        if answerArray[2] > -1 {
            switch Questions(rawValue: 2)!.descriptions[answerArray[2]] {
            case "Yes":
                runningPrice += 3000
                numberOfPages += 2
            default:
                break
            }
        }
        
        if answerArray[3] > -1 {
            switch Questions(rawValue: 3)!.descriptions[answerArray[3]] {
            case "Upfront cost":
                runningPrice += 1000
            case "In-app purchases":
                runningPrice += 3000
                numberOfPages += 2
            default:
                break
            }
        }
        
        if answerArray[4] > -1 {
            switch Questions(rawValue: 4)!.descriptions[answerArray[4]] {
            case "Yes":
                runningPrice += 3000
                numberOfPages += 2
            default:
                break
            }
        }
        
        if answerArray[5] > -1 {
            switch Questions(rawValue: 5)!.descriptions[answerArray[5]] {
            case "Yes":
                runningPrice += 5000
            default:
                break
            }
        }
        
        if answerArray[6] > -1 {
            switch Questions(rawValue: 6)!.descriptions[answerArray[6]] {
            case "Bare-bones":
                runningPrice += 500 * numberOfPages
                typeOfDesign = "Bare-bones"
            case "Stock":
                runningPrice += 5000
                runningPrice += 500 * numberOfPages
                typeOfDesign = "Stock"
            case "Beautiful":
                runningPrice += 10000
                runningPrice += 500 * numberOfPages
                typeOfDesign = "Beautiful"
            default:
                break
            }
        }
        
        if answerArray[7] > -1 {
            switch Questions(rawValue: 7)!.descriptions[answerArray[7]] {
            case "Yes":
                switch typeOfDesign {
                case "Bare-bones":
                    runningPrice += 500
                case "Stock":
                    runningPrice += 1500
                case "Beautiful":
                    runningPrice += 4000
                default:
                    break
                }
            default:
                break
            }
        }
        
        numberOfApps == 2 ? (totalPrice = runningPrice * 2) : (totalPrice = runningPrice)
        totalPriceLabel.text = "$\(Helper.setPriceLabels())"
    }
    
    func startAgainButtonTapped() {
        answerArray = [-1,-1,-1,-1,-1,-1,-1,-1]
        currentQuestionNumber = 0
        runningPrice = 0
        totalPrice = 0
        numberOfApps = 1
        numberOfPages = 0
        typeOfDesign = "Unknown"
        totalPriceLabel.text = "$0"
        summaryPageReached = false
    }
    
    func changeButtonTapped(cellNumber:Int) {
        summaryPageReached = true
        currentQuestionNumber = cellNumber
    }
    
}