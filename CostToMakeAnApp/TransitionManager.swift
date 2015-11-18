//
//  TransitionManager.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 17/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

@objc protocol InnerSlideViewController {
    func viewsToSlide() -> [UIView]
}

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    private var presenting = false
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView()
        let from = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let to = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let secondViewController = !self.presenting ? from : to
        let viewController = !self.presenting ? to : from
        
        let secondView = secondViewController!.view
        let firstView = viewController!.view
        
        // setup slide transitions for animations
        let offstageLeft = CGAffineTransformMakeTranslation(-250, 0)
        let offstageRight = CGAffineTransformMakeTranslation(250, 0)
        
        // prepare the new VC to fade in and items to slide in
        if (self.presenting){
            secondView.alpha = 0
            if let InnerSlideVC = secondViewController as? InnerSlideViewController {
                transformItemInView(offstageRight, vc: InnerSlideVC)
            }
        }

        // add both views to our container
        container!.addSubview(firstView)
        container!.addSubview(secondView)
        
        let duration = self.transitionDuration(transitionContext)
        
        
        UIView.animateWithDuration(duration, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            if (self.presenting){
                // fade in and slide in
                secondView.alpha = 1
                if let InnerSlideVC = secondViewController as? InnerSlideViewController {
                    self.transformItemInView(CGAffineTransformIdentity, vc: InnerSlideVC)
                }
                
            }
            else {
                // fade out and slide out
                secondView.alpha = 0
                if let InnerSlideVC = secondViewController as? InnerSlideViewController {
                    self.transformItemInView(offstageLeft, vc: InnerSlideVC)
                }
            }
            
            }, completion: { finished in
                transitionContext.completeTransition(true)
        })
    }
    

    // =======
    // HELPERS
    // =======
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1.5
    }
    
    func transformItemInView(transformation: CGAffineTransform, vc: InnerSlideViewController) {
        for item in vc.viewsToSlide() {
            item.transform = transformation
        }
    }
    
    
    // ======================================================
    // UIViewControllerTransitioningDelegate protocol methods
    // ======================================================
    
    // return the animataor when presenting a viewcontroller
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    // return the animator used when dismissing from a viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
}
