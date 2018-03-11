//
//  SecondController.swift
//  全屏手势测试
//
//  Created by 王锦涛 on 2018/3/9.
//  Copyright © 2018年 JTWang. All rights reserved.
//

import UIKit

class SecondController: PushRootController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second"
        
        // 禁止侧滑返回
//        interactionTransition.isEnable = false
    }
    
    @IBAction func didClickPush(_ sender: UIButton) {
        navigationController?.pushViewController(ThirdController(), animated: true)
    }
    
    @IBAction func didClickPop(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
