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
        case .RateOrReview:
            return "Do people rate or review things?"
        case .API:
            return "Does your app need to connect with a website?"
        case .Design:
            return "How nice should your app look?"
        case .Icon:
            return "Do you need an app icon?"
        }
    }
    
    var descriptions:Array<String> {
        switch self {
        case .AppType:
            return ["Android", "Apple iOS", "Android and Apple iOS"]
        case .Login:
            return ["Email", "Social", "None", "I don't know"]
        case .Profiles:
            return ["Yes", "None", "I don't know"]
        case .MoneyMaking:
            return ["Upfront cost", "In-app purchases", "I won't", "I don't know"]
        case .RateOrReview:
            return ["Yes", "No", "I don't know"]
        case .API:
            return ["Yes", "No", "I don't know"]
        case .Design:
            return ["Bare-bones", "Stock", "Beautiful"]
        case .Icon:
            return ["Yes", "No", "I don't know"]
        }
    }
    
    var summaryDescriptions:Array<String> {
        switch self {
        case .AppType:
            return ["Built in Android", "Built in Apple iOS", "Built in Android and Apple iOS"]
        case .Login:
            return ["Login with Email", "Login with Social", "No login required", "I don't know if I need login"]
        case .Profiles:
            return ["Yes, there will be profiles", "No, there will be no profiles", "I don't know if I need profiles"]
        case .MoneyMaking:
            return ["Making money through upfront cost", "Making money through in-app purchases", "I won't make money from the app", "I don't know how I'll make money"]
        case .RateOrReview:
            return ["Yes, people will rate and review things", "No, people will not rate or review things", "I don't know if people will rate or review things"]
        case .API:
            return ["Yes, it will need to connect to a website", "No, it will not need to connect to a website", "I don't know if it will connect to a website"]
        case .Design:
            return ["The app only needs bare-bones design", "The app needs stock design", "The app needs to be beautifully designed"]
        case .Icon:
            return ["Yes, I will need an app icon", "No, I will not need an app icon", "I don't know if I will need an app icon"]
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
        case .RateOrReview:
            return [UIImage(named: "Rate")!, UIImage(named: "None")!, UIImage(named: "?")!]
        case .API:
            return [UIImage(named: "ConnectWebsite")!, UIImage(named: "None")!, UIImage(named: "?")!]
        case .Design:
            return [UIImage(named: "BareBones")!, UIImage(named: "Stock")!, UIImage(named: "Beautiful")!]
        case .Icon:
            return [UIImage(named: "AppIcon")!, UIImage(named: "None")!, UIImage(named: "?")!]
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
        case .RateOrReview:
            return "Keep in mind, ranking systems can vary in complexity and thus impact your budget."
        case .API:
            return "This means you'll need to make an API (or Application Programming Interface.) It's how all your friendly apps talk to each other."
        case .Design:
            return "Custom gestures, custom buttons, and custom transitions will cost you — it's not cheap being pretty."
        case .Icon:
            return "Designing a quality app icon typically ranges from $500 - $2,000 but will help you stand out in the app store and on the device."
        }
    }
    
    static var count: Int { return Questions.Icon.hashValue + 1}

}