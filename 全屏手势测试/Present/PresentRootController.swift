
//
//  PresentRootController.swift
//  全屏手势测试
//
//  Created by 王锦涛 on 2018/3/9.
//  Copyright © 2018年 JTWang. All rights reserved.
//

import UIKit

class PresentRootController: UIViewController {
    
    
    lazy var interaction = JTInteractiveTransition()
    
    var isOpenSlidingGesture = true {
        didSet{
           interaction.isEnable = isOpenSlidingGesture
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        transitioningDelegate = self
        modalPresentationStyle = .custom
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.randomColor
        interaction.addPanGesture(viewController: self)
        interaction.beginAnimationBlock = { [unowned self] in
            self.dismiss(animated: true, completion: nil)
        }
        interaction.deallocBlock = { [unowned self] in
            self.deallocFunc()
        }
    }
    
    
    /// 每个控制器 销毁资源的方法 
    func deallocFunc() {
        let asdf = String(describing: self.classForCoder)
        print("\(asdf) 销毁资源")
    }
    
    deinit {
        let asdf = String(describing: self.classForCoder)
        print("\(asdf) 控制器销毁")
    }

}
extension PresentRootController : UIViewControllerTransitioningDelegate{
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return interaction.isInteracting ? JTTransitionAnimation() : nil
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interaction
    }
}
