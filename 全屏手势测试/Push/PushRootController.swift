//
//  PushRootController.swift
//  全屏手势测试
//
//  Created by 王锦涛 on 2018/3/9.
//  Copyright © 2018年 JTWang. All rights reserved.
//

import UIKit

class PushRootController: UIViewController {
    
    let interactionTransition = JTInteractiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIButton()
        backButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        backButton.backgroundColor = UIColor.white
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        let leftItem = UIBarButtonItem.init(customView: backButton)
        navigationItem.leftBarButtonItem = leftItem
        view.backgroundColor = UIColor.randomColor
        
        interactionTransition.direction = .right
        interactionTransition.addPanGesture(viewController: self)
        interactionTransition.beginAnimationBlock = {
            [unowned self ] in
            self.navigationController?.popViewController(animated: true)
        }
        interactionTransition.deallocBlock = {
            [unowned self ] in
            self.deallocFunc()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.delegate = self
    }
    
    @objc func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
    
    /// 资源释放方法
    func deallocFunc(){
        let asdf = String(describing: self.classForCoder)
        print("\(asdf) 销毁资源")
    }
    
    deinit {
        let asdf = String(describing: self.classForCoder)
        print("\(asdf) 控制器销毁")
    }

}

extension PushRootController : UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .pop {
            return JTPopTransitionAnimation()
        }
        return nil
    }
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return interactionTransition.isInteracting ? interactionTransition : nil
    }
    
}
