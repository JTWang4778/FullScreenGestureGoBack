//
//  AnotherPresentController.swift
//  全屏手势测试
//
//  Created by 王锦涛 on 2018/3/9.
//  Copyright © 2018年 JTWang. All rights reserved.
//

import UIKit

class AnotherPresentController: PresentRootController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isOpenSlidingGesture = false
    }
    
    @IBAction func didClickDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didClickPresent(_ sender: UIButton) {
        
        self.present(ThridPresentController.init(planId: "1234"), animated: true, completion: nil)
    }
    
    
}
