//
//  HomePageCell.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 19/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class HomePageCell: UICollectionViewCell {
    
    lazy var contentViewController:UIViewController = self.createQuestionVC()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentViewController.view.frame = bounds
    }
    
    func addViewControllerToParentViewController(parentViewController: UIViewController) {
        parentViewController.addChildViewController(contentViewController)
        contentViewController.didMoveToParentViewController(parentViewController)
        contentViewController.view.frame = contentView.bounds
        contentView.insertSubview(contentViewController.view, atIndex: 99)
    }
    
    func removeViewControllerFromParentViewController() {
        contentViewController.view.removeFromSuperview()
        contentViewController.willMoveToParentViewController(nil)
        contentViewController.removeFromParentViewController()
    }
    
    private func createQuestionVC() -> UIViewController {
        let vc = QuestionViewController.loadFromNib()
        contentView.insertSubview(vc.view, atIndex: 99)
        return vc
    }
    
}
