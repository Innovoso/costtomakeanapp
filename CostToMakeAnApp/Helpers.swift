//
//  Helpers.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 20/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import Foundation

class Helper{
    
    static func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}