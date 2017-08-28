//
//  TCZTextFieldCell.swift
//  Dormouse
//
//  Created by liuyunxin on 2017/8/11.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import SnapKit

class TCZTextFieldCell: TCZBaseTableCell {
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    /// 占位文本
    var placeHolderString = "" {
        didSet{
         self.textField.placeholder = self.placeHolderString
        }
    }
    
    override func tczCreateBaseCellUI() {
        self.contentView.addSubview(self.textField)
    }
    
    override func layoutSubviews() {
        self.textField.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, kLeftEdge, 0, kLeftEdge))
        }
    }
}
