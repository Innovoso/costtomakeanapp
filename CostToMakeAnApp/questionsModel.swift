//
//  questionsModel.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 20/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import Foundation
import UIKit

enum Questions:Int {
    case AppType = 0, Login, Profiles, MoneyMaking, RateOrReview, API, Design, Icon
    
    var title:String {
        switch self {
        case .AppType:
            return "What type of app are you building?"
        case .Login:
            return "Do people have to login?"
        case .Profiles:
            return "Do people create profiles?"
        case .MoneyMaking:
            return "How will you make money?"
        default:
            return "Lala"
        }
    }
    
    var descriptions:Array<String> {
        switch self{
        case .AppType:
            return ["Android", "Apple iOS", "Android and Apple iOS"]
        case .Login:
            return ["Email", "Social", "None", "I don't know"]
        case .Profiles:
            return ["Yes", "None", "I don't know"]
        case .MoneyMaking:
            return ["Upfront cost", "In-app purchases", "I won't", "I don't know"]
        default:
            return ["Lala"]
        }
    }
    
    
    var images:[UIImage] {
        switch self {
        case .AppType:
            return [UIImage(named: "Android")!, UIImage(named: "iOS")!, UIImage(named: "iOS and Android")!]
        case .Login:
            return [UIImage(named: "Email")!, UIImage(named: "Social")!, UIImage(named: "None")!, UIImage(named: "?")!]
        case .Profiles:
            return [UIImage(named: "Profile")!, UIImage(named: "None")!, UIImage(named: "?")!]
        case .MoneyMaking:
            return [UIImage(named: "UpfrontCost")!,UIImage(named: "InAppPurchase")!, UIImage(named: "None")!, UIImage(named: "?")!]
        default:
            return [UIImage(named: "Profile")!, UIImage(named: "None")!, UIImage(named: "?")!]
        }
    }
    
    
    var infoCard:String {
        switch self {
        case .AppType:
            return "Apple iOS is a better choice to reach a more engaged user base. Android has a broader reach, especially in emerging markets like Asia and Africa."
        case .Login:
            return "An email login is generally best to start with unless your app will have tight integration with services like Facebook or Twitter, in which case social login is better."
        case .Profiles:
            return "A profile means that some of the people that use your app will have to enter information about themselves that might be viewed publicly."
        case .MoneyMaking:
            return "Upfront cost is cheaper to build than in-app purchases but in-app purchase can produce higher returns if/when you have an engaged user base."
        default:
            return "lala"
            
//            "Keep in mind, ranking systems can vary in complexity and thus impact your budget.",
//            "This means you'll need to make an API (or Application Programming Interface.) It's how all your friendly apps talk to each other.",
//            "Custom gestures, custom buttons, and custom transitions will cost you — it's not cheap being pretty.",
//            "Designing a quality app icon typically ranges from $500 - $2,000 but will help you stand out in the app store and on the device."

        }
    }

}