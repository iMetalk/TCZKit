//
//  TCZTitleTextFieldCell.swift
//  Dormouse
//
//  Created by 田向阳 on 2017/8/11.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit

class TCZTitleTextFieldCell: TCZBaseTableCell {

    //MARK:Action
    override func tczConfigureData(aItem: TCZTableViewData) {
        titleLabel.text = aItem.title
    }
    
   override func tczCreateBaseCellUI() {
    
    contentView.addSubview(titleLabel)
    contentView.addSubview(textField)
    
    titleLabel.snp.makeConstraints { (make) in
        make.left.equalToSuperview().offset(kLeftEdge)
        make.centerY.equalToSuperview()
        make.width.lessThanOrEqualTo(80)
        }
    
    textField.snp.makeConstraints { (make) in
        make.left.equalTo(titleLabel.snp.right).offset(kLeftEdge)
        make.bottom.top.equalToSuperview()
        make.right.equalToSuperview().offset(-kLeftEdge)
        }
    }
    
    //MARK: lazyVar
    lazy var titleLabel: UILabel = {
    let label = UILabel.tczLabel()
    return label
    }()
    
    lazy var textField: UITextField = {
    let textField = UITextField()
        textField.placeholder = "请输入内容"
        textField.font = UIFont.tcz_systemFontWithSize(size: 15)
        textField.textColor = .gray
        return textField
    }()

}
