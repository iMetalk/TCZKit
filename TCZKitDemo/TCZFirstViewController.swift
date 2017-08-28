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
        
        self.title = "TCZFirstViewController"
        
        self.footerDelegate = self
        self.headerDelegate = self
        
        self.headerSectionHeight = 44.0
        self.footerSectionHeight = 44.0
        
        self.isOpendDelete = true
        
        loadData(isGroup: false)
    }
    
    
    override func configureData() {
        super.configureData()
        for index in 1...10 {
            var item: TCZTableViewItem!
            if index % 2 == 0 {
                item.title = "Hello world"
                item.bottomTitle = "Hello world bottom"
                item = TCZTableViewItem(type: .TitleBottomSubtitle)
            }
            else{
                item = TCZTableViewItem(type: .ImageTitle)
            }
            
            dataArray.append(item)
            cellIndentifierSet.insert(item.type.cellName)
        }
        
    }
    
    override func tczDidDelete(atIndexPath indexPath: IndexPath) {
        tczDeleteLocalData(atIndexPath: indexPath, animation: .left)
    }
}

extension TCZFirstViewController: TCZTableViewFooterable {
    
    func footerView() -> UIView {
        let size = UIScreen.main.bounds.size
        let view = TCZActionView(frame: CGRect(x: 0, y: 0, width: size.width, height: kFooterHeight))
        view.button.setTitle("确定", for: .normal)
        view.backgroundColor = UIColor.lightGray
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
        label.backgroundColor = UIColor.lightGray
        return label
    }
}

