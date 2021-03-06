//
//  ViewController.swift
//  StarRating
//
//  Created by Andy on 2017/7/13.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, YTTStarRatingDelegate {

    private var label: UILabel!
    
    /// Description
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let starView = YTTStarRatingView(frame: CGRect(x: 10, y: 30, width: 310, height: 20), delegate: self)
        self.view.addSubview(starView)
        starView.rate = 0.8
        
        label = UILabel(frame: CGRect(x: 130, y: 30, width: 50, height: 20))
        self.view.addSubview(label)
        
        
        
    }

    func yttStarRatingView(_ starRatingView: YTTStarRatingView, rate: CGFloat) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

