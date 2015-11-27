//
//  Circle.swift
//  CircleBom
//
//  Created by ldjhust on 15/11/26.
//  Copyright © 2015年 ldj. All rights reserved.
//

import UIKit

class Circle: UIView {
  
  var initialFrame = CGRectZero
  var progress:CGFloat = 0.5

  override func drawRect(rect: CGRect) {
    // 获取当前画布
    
    let offset = initialFrame.width / 3.6
    let moveDistance = (initialFrame.width * 1 / 5) * CGFloat(fabs(progress - 0.5) * 2)
    NSLog ("%f", moveDistance)
    
    let originCenter = CGPoint(x: initialFrame.origin.x + initialFrame.width/2,
                               y: initialFrame.origin.y + initialFrame.height/2)
    let pointA = CGPoint(x: originCenter.x, y: originCenter.y - initialFrame.height/2 + moveDistance)
    let pointB = CGPoint(x: originCenter.x + initialFrame.width/2, y: originCenter.y)
    let pointC = CGPoint(x: originCenter.x, y: originCenter.y + initialFrame.height/2 - moveDistance)
    let pointD = CGPoint(x: originCenter.x - initialFrame.width/2 - moveDistance, y: originCenter.y)
    
    let c1 = CGPoint(x: pointA.x + offset, y: pointA.y)
    let c2 = CGPoint(x: pointB.x, y: pointB.y - offset)
    let c3 = CGPoint(x: pointB.x, y: pointB.y + offset)
    let c4 = CGPoint(x: pointC.x + offset, y: pointC.y)
    let c5 = CGPoint(x: pointC.x - offset, y: pointC.y)
    let c6 = CGPoint(x: pointD.x, y: pointD.y + offset - moveDistance)
    let c7 = CGPoint(x: pointD.x, y: pointD.y - offset + moveDistance)
    let c8 = CGPoint(x: pointA.x - offset, y: pointA.y)
    
    let bezierPath = UIBezierPath()
    
    // 设置填充颜色
    UIColor.redColor().setFill()
    
    // 开始画
    bezierPath.moveToPoint(pointA)
    bezierPath.addCurveToPoint(pointB, controlPoint1: c1, controlPoint2: c2)
    bezierPath.addCurveToPoint(pointC, controlPoint1: c3, controlPoint2: c4)
    bezierPath.addCurveToPoint(pointD, controlPoint1: c5, controlPoint2: c6)
    bezierPath.addCurveToPoint(pointA, controlPoint1: c7, controlPoint2: c8)
    bezierPath.closePath()
    // 开始填充
    bezierPath.fill()
  }

}
