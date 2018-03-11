//
//  ThridPresentController.swift
//  全屏手势测试
//
//  Created by 王锦涛 on 2018/3/9.
//  Copyright © 2018年 JTWang. All rights reserved.
//

import UIKit

class ThridPresentController: PresentRootController {
    
    let planID : String
    init(planId : String) {
        planID = planId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func deallocFunc() {
        print("资源销毁\(planID)")
    }

}
