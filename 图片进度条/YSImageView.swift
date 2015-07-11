//
//  YSImageView.swift
//  图片进度条
//
//  Created by Joseph on 7/10/15.
//  Copyright © 2015 Joseph. All rights reserved.
//

import UIKit


class YSImageView: UIImageView {

    var progress: CGFloat = 0 {
        didSet {
            progressV.progess = progress
            
            progressV.hidden = progress == 0 ? true : false
        }
    }
    

    private lazy var progressV: YSView = { [unowned self] in
        let progressV = YSView()
        
        self.addSubview(progressV)
        progressV.ff_Fill(self)
        
        return progressV
    }()

    
}



private class YSView: UIView {

    /// 进度值
    var progess: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    private override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        // 绘制第一个圆
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        let radius = min(rect.width, rect.height) * 0.4
        let rect = CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)
        
        let cycle = UIBezierPath(ovalInRect: rect)
        
        UIColor(white: 1.0, alpha: 0.5).setFill()
        cycle.fill()


        // 绘制进度
        let startAngle = CGFloat(-M_PI_2)
        let endAngle = CGFloat(M_PI * 2) * progess + startAngle
        let cyclePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        cyclePath.addLineToPoint(center)
        cyclePath.closePath()
        
        UIColor(white: 0.0, alpha: 0.4).setFill()
        cyclePath.fill()
    
    }
}




