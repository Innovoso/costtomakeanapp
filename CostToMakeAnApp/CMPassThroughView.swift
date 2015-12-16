//
//  CMPassThroughView.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 01/12/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

@objc protocol CMPassThroughViewDelegate {
    func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView?
}

class CMPassThroughView: UIView {

    weak var delegate: CMPassThroughViewDelegate?
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        if let delegate = delegate {
            return delegate.hitTest(point, withEvent: event)
        }
        return super.hitTest(point, withEvent: event)
    }

}
