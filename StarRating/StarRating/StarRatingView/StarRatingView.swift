//
//  StarRatingView.swift
//  StarRating
//
//  Created by Andy on 2017/7/13.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//

/**
 *
 *  Author: AndyCui
 *
 *  Description: 防淘宝星级评分,通过图片实现评分视图的实现.添加背景视图和前景视图,通过控制前景视图实现评分的实现
 *
 */





import UIKit


protocol StarRatingDelegate {
    func ay_starRateChange(rate: CGFloat) -> Void;
}


class StarRatingView: UIView {
    
    private var totalStarNumber: Int!
    private var foregroundView: UIView!
    private var delegate: StarRatingDelegate?
    
    var rate: CGFloat! = 0{
        didSet{
            var rect = foregroundView.frame
            rect.size.width = self.frame.width * rate
            foregroundView.frame = rect
        }
    }
    
    

    init(frame: CGRect, totalStarts: Int = 5, delegate: StarRatingDelegate? = nil) {
        super.init(frame: frame)
        totalStarNumber = totalStarts
        self.delegate = delegate
        self.addSubview(self.ay_creatStartView("haoping_gray"))
        foregroundView = self.ay_creatStartView("haoping_orange")
        self.addSubview(foregroundView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func ay_creatStartView(_ imageName: String) -> UIView {
        let starView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        starView.clipsToBounds = true
        starView.backgroundColor = UIColor.clear
        starView.isUserInteractionEnabled = false
        let imgViewWidth = (self.frame.width - CGFloat(totalStarNumber - 1) * 3) / CGFloat(totalStarNumber)
        
        for i in 0 ..< totalStarNumber {
            let imageView = UIImageView(image: UIImage(named: imageName))
            imageView.frame = CGRect(x: CGFloat(i) * (imgViewWidth + 3), y: 0, width: imgViewWidth, height: self.frame.height)
            imageView.contentMode = .scaleAspectFit
            starView.addSubview(imageView)
        }
        return starView
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch?.location(in: self)
        if (point?.x)! >= CGFloat(0) && (point?.x)! <= self.frame.width {
            rate = (point?.x)! / self.frame.width
            delegate?.ay_starRateChange(rate: rate)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch?.location(in: self)
        rate = (point?.x)! / self.frame.width
        delegate?.ay_starRateChange(rate: rate)
    }
    
    
   
    
    
    
    
    
    
    
    
    
    
    
}
