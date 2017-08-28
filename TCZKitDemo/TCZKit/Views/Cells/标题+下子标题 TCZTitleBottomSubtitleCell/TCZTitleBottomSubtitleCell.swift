//
//  TCZTitleBottomSubtitleCell.swift
//  Dormouse
//
//  Created by tczy on 2017/8/14.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit

class TCZTitleBottomSubtitleCell: TCZBaseTableCell {

    override func tczConfigureData(aItem: TCZTableViewData) {
        
        titleLabel.text = aItem.title
        subtitleLabel.text = aItem.bottomTitle
    }
    
    override func tczCreateBaseCellUI() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(kLeftEdge)
            make.right.equalToSuperview().offset(-kLeftEdge)
            make.bottom.equalTo(contentView.snp.centerY)
        }
        
        subtitleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(kLeftEdge)
            make.right.equalToSuperview().offset(-kLeftEdge)
            make.top.equalTo(contentView.snp.centerY).offset(2)
        }
    }
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel.tczLabel()
        return label
    }()

    lazy var subtitleLabel: UILabel = {
        
        let label = UILabel.tczLabel(text: nil, font: UIFont.tcz_systemFontWithSize(size: 13), color: UIColor.gray)
        return label
    }()
}
