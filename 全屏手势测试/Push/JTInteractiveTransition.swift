//
//  JTInteractiveTransition.swift
//  全屏手势测试
//
//  Created by 王锦涛 on 2018/3/8.
//  Copyright © 2018年 JTWang. All rights reserved.
//

import UIKit

enum InteractiveTransitionDirection {
    case left
    case right
    case up
    case down
}

class JTInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    weak var vc : UIViewController?
    
    var isInteracting = false
    var isEnable = true
    
    var direction : InteractiveTransitionDirection = .down
    
    var beginAnimationBlock : (() -> Void)?
    var deallocBlock : (() -> Void)?
    
    func addPanGesture(viewController : UIViewController){
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(handleGesture(ges:)))
        vc = viewController
        viewController.view.addGestureRecognizer(pan)
    }
    
    @objc func handleGesture(ges: UIPanGestureRecognizer){
        
        guard isEnable == true else {
            return
        }
        var percent : CGFloat = 0.0
        switch direction {
        case .down:
            percent = ges.translation(in: ges.view).y / screenWidth
        case .right:
            percent = ges.translation(in: ges.view).x / screenWidth
        default:
            print("")
        }
        
        
        switch ges.state {
        case .began:
            isInteracting = true
            if let call = beginAnimationBlock {
                call()
            }
        case .changed:
            update(percent)
        case .ended, .cancelled:
            
            if percent > 0.5 {
                finish()
            }else{
                cancel()
            }
            isInteracting = false
        default :
            print("default")
        }
    }

}
