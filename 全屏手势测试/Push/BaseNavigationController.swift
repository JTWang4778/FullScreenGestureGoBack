//
//  BaseNavigationController.swift
//  全屏手势测试
//
//  Created by 王锦涛 on 2018/3/9.
//  Copyright © 2018年 JTWang. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.barTintColor = UIColor.orange
//        delegate = self
    }
}


