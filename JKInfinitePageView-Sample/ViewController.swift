//
//  ViewController.swift
//  JKInfinitePageView-Sample
//
//  Created by Joe on 2017/3/13.
//  Copyright © 2017年 Joe. All rights reserved.
//

import UIKit

class GrayView: UIView{
    
    var white: CGFloat = 0{
        didSet{
            backgroundColor = UIColor(white: white, alpha: 1)
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var pageView: JKInfinitePageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageView.dataSource = self
        
        let view = GrayView(frame: CGRect.zero)
        view.white = 0.5
        pageView.setView(view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: JKInfinitePageViewDataSource{
    
    func infinitePageView(_ infinitePageView: JKInfinitePageView, viewBefore view: UIView) -> UIView {
        let currentView = view as! GrayView
        let beforeView = GrayView(frame: CGRect.zero)
        
        var newWhite = currentView.white + 0.1
        if newWhite > 1{
            newWhite = 0
        }
        beforeView.white = newWhite
        
        return beforeView
    }
    
    func infinitePageView(_ infinitePageView: JKInfinitePageView, viewAfter view: UIView) -> UIView {
        let currentView = view as! GrayView
        let afterView = GrayView(frame: CGRect.zero)
        
        var newWhite = currentView.white - 0.1
        if newWhite < 0{
            newWhite = 1
        }
        afterView.white = newWhite
        
        print(newWhite)
        return afterView
    }
}

