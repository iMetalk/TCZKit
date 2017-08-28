//
//  TCZPlainViewController.swift
//  TCZKitDemo
//
//  Created by WangSuyan on 2016/11/29.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit

class TCZPlainViewController: TCZBaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TCZFirstViewController"
        
        self.isOpendDelete = true
        
        loadData(isGroup: false)
    }
    
    
    override func configureData() {
        super.configureData()
        for index in 1...10 {
            var item: TCZTableViewItem!
            if index % 2 == 0 {
                item = TCZTableViewItem(type: .LeftTitle)
                item.title = "Hello world"
            }
            else{
                item = TCZTableViewItem(type: .LeftImageTitle)
                item.title = "Image title"
                item.image = UIImage(named: "leftImage")
            }
            
            dataArray.append(item)
            cellIndentifierSet.insert(item.type.cellName)
        }
    }
    
    override func tczDidDelete(atIndexPath indexPath: IndexPath) {
        tczDeleteLocalData(atIndexPath: indexPath, animation: .left)
    }
}
