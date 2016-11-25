//
//  TCZTableViewProtocol.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/14.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit


/// The tableView footer
protocol TCZTableViewFooterable {
    
    func footerView() -> UIView
}

extension TCZTableViewFooterable {
    
    func footerView() -> UIView {
        let size = UIScreen.main.bounds.size
        let view = TCZActionView(frame: CGRect(x: 0, y: 0, width: size.width, height: TCZConstant.kFooterHeight))
        return view

    }
}



protocol TCZTableViewHeaderable {
    
    func headerView() -> UIView
}
