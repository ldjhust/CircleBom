//
//  ViewController.swift
//  CircleBom
//
//  Created by ldjhust on 15/11/26.
//  Copyright © 2015年 ldj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
  private var scrollView: UIScrollView!
  private var circle: Circle!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 初始化subivew
    scrollView = UIScrollView(frame: view.frame)
    
    scrollView.delegate = self
    scrollView.pagingEnabled = true
    scrollView.contentSize = CGSize(width: view.frame.width*2, height: view.frame.height)
    
    let whiteView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
    whiteView.backgroundColor = UIColor.whiteColor()
    
    let grayView = UIView(frame: CGRect(x: view.frame.width, y: 0, width: view.frame.width, height: view.frame.height))
    grayView.backgroundColor = UIColor.grayColor()
    
    scrollView.addSubview(whiteView)
    scrollView.addSubview(grayView)
    
    circle = Circle()
    circle.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 100)
    circle.backgroundColor = UIColor.clearColor()
    circle.initialFrame.size = CGSize(width: 100, height: 100)
    circle.initialFrame.origin = CGPoint(x: view.frame.width/2-50, y: 0)
    circle.setNeedsDisplay()
    
    self.view.addSubview(scrollView)
    self.view.addSubview(circle)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func scrollViewDidScroll(scrollView: UIScrollView) {
    if scrollView.contentOffset.x <= scrollView.frame.width / 2 {
      circle.progress = (scrollView.contentOffset.x + scrollView.frame.width / 2) / scrollView.frame.width
    } else {
      circle.progress = (scrollView.contentOffset.x - scrollView.frame.width / 2) / scrollView.frame.width
    }
    NSLog ("%f", circle.progress)
    circle.setNeedsDisplay()
  }
}

