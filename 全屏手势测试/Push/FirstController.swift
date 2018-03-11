//
//  FirstController.swift
//  全屏手势测试
//
//  Created by 王锦涛 on 2018/3/9.
//  Copyright © 2018年 JTWang. All rights reserved.
//

import UIKit

class FirstController: PushRootController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "first"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didClickPop(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didClickPush(_ sender: UIButton) {
        self.navigationController?.pushViewController(SecondController(), animated: true)
    }
    

}
