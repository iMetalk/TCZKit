//
//  UITableView+TCZ.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/14.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit

extension UITableView {
    
    class func tczTableView(frame: CGRect, isGroup: Bool) -> UITableView {
        var tableView: UITableView
        if isGroup {
            tableView = UITableView(frame: frame, style: .grouped)
        }else{
            tableView = UITableView(frame: frame, style: .plain)
        }
        tableView.tableFooterView = UIView()
        
        return tableView
    }
    
}
