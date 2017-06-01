//
//  MyView.swift
//  SwiftProject1
//
//  Created by wanplus on 2016/10/17.
//  Copyright © 2016年 wanplus. All rights reserved.
//

import UIKit

typealias Action = () -> Void

class MyView: UIView {

    var action: Action?
    
    init(action: @escaping Action) {
        self.action = action;
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
