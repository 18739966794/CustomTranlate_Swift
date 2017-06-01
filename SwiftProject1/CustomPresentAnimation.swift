//
//  CustomPresentAnimation.swift
//  SwiftProject1
//
//  Created by wanplus on 2017/5/25.
//  Copyright © 2017年 wanplus. All rights reserved.
//

import UIKit

class CustomPresentAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        transitionContext.containerView.backgroundColor = UIColor.white
        
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        
        transitionContext.containerView.insertSubview(toView!, belowSubview: fromView!)
        
        toView?.transform = CGAffineTransform(translationX: 0, y: height)
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: { 
            toView?.transform = CGAffineTransform.identity
            fromView?.transform = CGAffineTransform(translationX: 0, y: -height)
        }) { (completion) in
            fromView?.transform = CGAffineTransform.identity
            transitionContext.completeTransition(completion)
        }
        
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
}
