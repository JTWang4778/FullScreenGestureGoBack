//
//  PresentController.swift
//  全屏手势测试
//
//  Created by 王锦涛 on 2018/3/8.
//  Copyright © 2018年 JTWang. All rights reserved.
//

import UIKit

class PresentController: PresentRootController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickDismiss(_ sender: UIButton) {
        
        deallocFunc()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func didClickPresent(_ sender: UIButton) {
        self.present(AnotherPresentController(), animated: true, completion: nil)
    }
    
}
