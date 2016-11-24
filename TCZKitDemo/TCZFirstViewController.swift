//
//  TCZFirstViewController.swift
//  TCZKitDemo
//
//  Created by WangSuyan on 2016/11/24.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit

class TCZFirstViewController: TCZBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData(isGroup: false)
    }
    
    override func configureData() {
        for index in 1...10 {
            var item: TCZTableViewItem!
            if index % 2 == 0 {
                item = TCZTableViewItem(type: .LeftTitle, title: "Hello, I am a title label cell", image: nil, bottomTitle: nil)
            }
            else{
                item = TCZTableViewItem(type: .LeftImageTitle, title: "Hello, I am a image title cell", image: UIImage(named: "leftImage"), bottomTitle: nil)
            }
            
            dataArray.append(item)
            cellSet.add(item.type.cellName)
        }
        
    }


}
