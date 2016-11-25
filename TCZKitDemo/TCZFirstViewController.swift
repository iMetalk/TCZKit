//
//  TCZFirstViewController.swift
//  TCZKitDemo
//
//  Created by WangSuyan on 2016/11/24.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit

class TCZFirstViewController: TCZBaseTableViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.footerDelegate = self
        self.headerDelegate = self
        
        loadData(isGroup: false)
    }
    
    
    override func configureData() {
        super.configureData()
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

extension TCZFirstViewController: TCZTableViewFooterable {
    
    func footerView() -> UIView {
        let size = UIScreen.main.bounds.size
        let view = TCZActionView(frame: CGRect(x: 0, y: 0, width: size.width, height: TCZConstant.kFooterHeight))
        view.button.setTitle("确定", for: .normal)
        view.actionClick = {
            print("footer click")
        }
        return view
    }
}

extension TCZFirstViewController: TCZTableViewHeaderable {
    
    func headerView() -> UIView {
        let label = UILabel.tczLabel()
        label.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100)
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "Hello, i am a headerView";
        return label
    }
}

