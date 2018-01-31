//
//  CustomPushTransitionAnimation.swift
//  SwiftProject1
//
//  Created by wanplus on 2017/5/23.
//  Copyright © 2017年 wanplus. All rights reserved.
//

import UIKit

let width = UIScreen.main.bounds.size.width
let height = UIScreen.main.bounds.size.height

class CustomPushTransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        
        toView?.transform = CGAffineTransform(translationX: width, y: height)
        containerView.addSubview(toView!)
        
        // 避免其他手势事件的干扰
        UIApplication.shared.beginIgnoringInteractionEvents()
        // 执行具体动画
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            toView?.transform = CGAffineTransform.identity
            fromView?.transform = CGAffineTransform(translationX: -width, y: -height)
        }) { (completion) in
            fromView?.transform = CGAffineTransform.identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
}
