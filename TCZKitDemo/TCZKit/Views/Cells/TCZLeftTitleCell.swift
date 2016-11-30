//
//  TCZLeftTitleCell.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/15.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

/*
 Only a left title
 
 ==== Title ==============
 
 */

import UIKit

class TCZLeftTitleCell: TCZBaseCell {

    
    /// Title label
    lazy var titleLabel: UILabel = {
        let label = UILabel.tczLabel()
        return label
    }()
    
    override func tczCreateBaseCellUI() {
        accessoryType = .disclosureIndicator
        
        // Title label
        contentView.addSubview(self.titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(TCZConstant.kLeftEdge)
            make.right.equalToSuperview().offset(-TCZConstant.kLeftEdge)
            make.top.bottom.equalToSuperview()
        }

    }
    
    override func tczConfigureData(aItem: TCZTableViewItem) {
        if let title = aItem.title{
            titleLabel.text = title
        }
    }

}
