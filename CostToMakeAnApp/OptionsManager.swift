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
    var questionArray = Array<Int>()
    var runningPrice = Int()
    var totalPrice = Int()
    var totalPriceLabel: UILabel!
    var numberOfApps = 1
    var numberOfPages = 0
    var typeOfDesign = "Unknown"
    var moveToPageNumber = 0
    var summaryPageReached = false
    
    init() {
    }
    
    func returnQuestionNumber(questionNumber:Int){
        questionArray.append(questionNumber)
    }
    
    func addToPrice(itemToBeAdded:Int) {
        answerArray.append(itemToBeAdded)
        
        switch Questions(rawValue: questionArray.last!)! {

            case .AppType:
                switch Questions(rawValue: 0)!.descriptions[answerArray.last!] {
                case "Android":
                    return runningPrice += 10000
                case "Apple iOS":
                    return runningPrice += 8000
                case "Android and Apple iOS":
                    runningPrice += 9000
                    numberOfApps = 2
                    return
                default:
                    return
                }
            
            case .Login:
                switch Questions(rawValue: 1)!.descriptions[answerArray.last!] {
                case "Email":
                    runningPrice += 2000
                    numberOfPages += 3
                case "Social":
                    runningPrice += 4000
                    numberOfPages += 2
                default:
                    return
                }
            
            case .Profiles:
                switch Questions(rawValue: 2)!.descriptions[answerArray.last!] {
                case "Yes":
                    runningPrice += 3000
                    numberOfPages += 2
                default:
                    return
                }
            
            case .MoneyMaking:
                switch Questions(rawValue: 3)!.descriptions[answerArray.last!] {
                case "Upfront cost":
                    runningPrice += 1000
                case "In-app purchases":
                    runningPrice += 3000
                    numberOfPages += 2
                default:
                    return
            }

            
            case .RateOrReview:
                switch Questions(rawValue: 4)!.descriptions[answerArray.last!] {
                case "Yes":
                    runningPrice += 3000
                    numberOfPages += 2
                default:
                    return
            }
            
            case .API:
                switch Questions(rawValue: 5)!.descriptions[answerArray.last!] {
                case "Yes":
                    runningPrice += 5000
                default:
                    return
            }
            
            case .Design:
                switch Questions(rawValue: 6)!.descriptions[answerArray.last!] {
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
                    return
            }
            
            case .Icon:
                switch Questions(rawValue: 7)!.descriptions[answerArray.last!] {
                case "Yes":
                    switch typeOfDesign {
                    case "Bare-bones":
                        runningPrice += 500
                    case "Stock":
                        runningPrice += 1500
                    case "Beautiful":
                        runningPrice += 4000
                    default:
                        return
                    }
                default:
                    return
            }
        }
    }

    func updateAndShowPriceLabel() {
        numberOfApps == 2 ? (totalPrice = runningPrice * 2) : (totalPrice = runningPrice)
        totalPriceLabel.text = "$\(totalPrice)"
    }
    
    func startAgainButtonTapped() {
        answerArray = []
        questionArray = []
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
        print(cellNumber)
    }
    
}