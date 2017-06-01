//
//  CustomPopTransitionAnimation.swift
//  SwiftProject1
//
//  Created by wanplus on 2017/5/23.
//  Copyright © 2017年 wanplus. All rights reserved.
//

import UIKit

class CustomPopTransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        transitionContext.containerView.backgroundColor = UIColor.white
        
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        
        transitionContext.containerView.insertSubview(toView!, belowSubview: fromView!)
        toView?.transform = CGAffineTransform(translationX: -width, y: -height)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: { 
            toView?.transform = CGAffineTransform.identity
            fromView?.transform = CGAffineTransform(translationX: width, y: height)
        }) { (completion) in
            fromView?.transform = CGAffineTransform.identity
            transitionContext.completeTransition(transitionContext.transitionWasCancelled)
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
}
