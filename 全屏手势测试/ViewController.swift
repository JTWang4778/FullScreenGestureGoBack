//
//  ViewController.swift
//  全屏手势测试
//
//  Created by 王锦涛 on 2018/3/8.
//  Copyright © 2018年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func didClickPresent(_ sender: UIButton) {
        let asdf = PresentController.init(nibName: nil, bundle: nil)
        self.present(asdf, animated: true, completion: nil)
    }
    
    @IBAction func didClickPush(_ sender: UIButton) {
        
        self.navigationController?.pushViewController(FirstController(), animated: true)
    }
    
    
}

