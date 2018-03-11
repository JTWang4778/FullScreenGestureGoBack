//
//  JTTransitionAnimation.swift
//  全屏手势测试
//
//  Created by 王锦涛 on 2018/3/8.
//  Copyright © 2018年 JTWang. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

class JTTransitionAnimation: NSObject , UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVc = transitionContext.viewController(forKey: .from),let _ = transitionContext.viewController(forKey: .to) else {
            return
        }
        let container = transitionContext.containerView
        
        guard let fromView = container.subviews.last else{ return }
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.frame.origin.y = screenHeight
        }) { (finished) in
            
            if transitionContext.transitionWasCancelled {
                transitionContext.completeTransition(false)
            }else{
                fromView.removeFromSuperview()
                if let controller = fromVc as? PresentRootController {
                    controller.deallocFunc()
                }
                transitionContext.completeTransition(true)
            }
        }
        
    }
    

}
