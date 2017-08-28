//
//  TCZTitleRightSubtitleCell.swift
//  Dormouse
//
//  Created by tczy on 2017/8/14.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import Foundation

class TCZTitleRightSubtitleCell: TCZBaseTableCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.tczLabel()
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel.tczLabel(text: nil, font: UIFont.tcz_systemFontWithSize(size: 13), color: UIColor.gray)
        label.textAlignment = .right
        return label
    }()
    
    override func tczCreateBaseCellUI() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.detailLabel)
    }
    
    override func tczConfigureData(aItem: TCZTableViewData) {
        self.titleLabel.text = aItem.title
        self.detailLabel.text = aItem.rightTitle
    }
    
    override func layoutSubviews() {
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(kLeftEdge)
            make.centerY.equalToSuperview()
            make.width.lessThanOrEqualTo(120)
        }
        
        self.detailLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-kLeftEdge)
            make.centerY.equalToSuperview()
            make.left.equalTo(titleLabel.snp.right).offset(kItemSpace)
        }
    }
}
