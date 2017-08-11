//
//  ViewController.swift
//  TCZKitDemo
//
//  Created by WangSuyan on 2016/11/24.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TCZKit"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tableViewVC = TCZFirstViewController()
        navigationController?.pushViewController(tableViewVC, animated: true)
    }

}

