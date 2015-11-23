//
//  HomePageCell.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 19/11/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class HomePageCell: UICollectionViewCell {
    
    lazy var contentViewController:QuestionViewController = self.createQuestionVC()
    var cellNumber:Int = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentViewController.view.frame = bounds
    }
    
    func addViewControllerToParentViewController(parentViewController: UIViewController) {
        parentViewController.addChildViewController(contentViewController)
        if let vc = contentViewController as? QuestionViewController {
            vc.questionNumber = cellNumber
        }
        contentViewController.didMoveToParentViewController(parentViewController)
        contentViewController.view.frame = contentView.bounds
        contentView.insertSubview(contentViewController.view, atIndex: 99)
    }
    
    func removeViewControllerFromParentViewController() {
        contentViewController.view.removeFromSuperview()
        contentViewController.willMoveToParentViewController(nil)
        contentViewController.removeFromParentViewController()
    }
    
    func configure(questionNumber: Int?) {
        cellNumber = questionNumber!
    }
    
    private func createQuestionVC() -> QuestionViewController {
        let vc = QuestionViewController.loadFromNib(cellNumber)
        contentView.insertSubview(vc.view, atIndex: 99)
        return vc
    }
    
}
