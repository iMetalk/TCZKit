//
//  TCZImageTitleRightSubtitleCell.swift
//  Dormouse
//
//  Created by 武卓 on 2017/8/14.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import SnapKit

class TCZImageTitleRightSubtitleCell: TCZBaseTableCell {
    
    /// Change icon size
    var iconSize: CGSize = CGSize.zero {
        didSet {
            leftImageView.snp.updateConstraints { (make) in
                make.width.equalTo(iconSize.width)
                make.height.equalTo(iconSize.height)
            }
        }
    }
    
    lazy var titleLabel: UILabel  = {
        
        let label = UILabel.tczLabel()
        return label
    }()
    
    lazy var detailLabel: UILabel  = {
        
        let label = UILabel.tczLabel(text: nil, font: UIFont.tcz_systemFontWithSize(size: 13), color: UIColor.gray)
        label.textAlignment = .right
        return label
    }()
    
    lazy var leftImageView :UIImageView = {
        
        let view = UIImageView.tczImageView()
        return view
    }()
    
    override func tczCreateBaseCellUI() {
        super.tczCreateBaseCellUI()
        
        contentView.addSubview(leftImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        
        leftImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(kLeftEdge)
            make.width.equalTo(self.contentView.frame.height * 0.8)
            make.height.equalTo(self.contentView.frame.height * 0.8)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(leftImageView.snp.right).offset(kItemSpace)
            make.centerY.equalToSuperview()
        }
        
        detailLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-kLeftEdge)
            make.left.equalTo(titleLabel.snp.right).offset(kItemSpace)
            make.centerY.equalToSuperview()
        }
        
    }
    
    override func tczConfigureData(aItem: TCZTableViewData) {
        
        titleLabel.text = aItem.title
        detailLabel.text = aItem.rightTitle
        leftImageView.image = aItem.image
    }
    
}
