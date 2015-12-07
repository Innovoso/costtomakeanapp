//
//  CMContactViewController.swift
//  CostToMakeAnApp
//
//  Created by Charlie Morris on 03/12/2015.
//  Copyright © 2015 Mind Fund Studio. All rights reserved.
//

import UIKit

class CMContactViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        contentView.frame.size.width = view.frame.width
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor(red: 219/255, green: 51/255, blue: 64/255, alpha: 1)
        scrollView.contentSize = contentView.bounds.size
        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    @IBAction func backButtonTapped(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
