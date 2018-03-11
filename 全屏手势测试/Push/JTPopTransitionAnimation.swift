//
//  JTPopTransitionAnimation.swift
//  全屏手势测试
//
//  Created by 王锦涛 on 2018/3/9.
//  Copyright © 2018年 JTWang. All rights reserved.
//

import UIKit

class JTPopTransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVc = transitionContext.viewController(forKey: .from), let navi = fromVc.navigationController,let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        let container = transitionContext.containerView
        
        guard let tempView = container.subviews.last else{ return }
        container.addSubview(toVC.view)
        container.sendSubview(toBack: toVC.view)
        
        // pop动画时  控制器view的动画 和 导航栏上的动画效果不一样 导航栏上的元素是渐变 而控制器的view是移动 
//        guard let tempView = navi.view.snapshotView(afterScreenUpdates: false) else{
//            return
//        }
//        container.addSubview(toVC.view)
//        container.addSubview(tempView)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            tempView.frame.origin.x = screenWidth
        }) { (finished) in
            
            if transitionContext.transitionWasCancelled {
                transitionContext.completeTransition(false)
            }else{
                tempView.removeFromSuperview()
                if let controller = fromVc as? PushRootController {
                    controller.deallocFunc()
                }
                transitionContext.completeTransition(true)
            }
        }
        
    }
}
