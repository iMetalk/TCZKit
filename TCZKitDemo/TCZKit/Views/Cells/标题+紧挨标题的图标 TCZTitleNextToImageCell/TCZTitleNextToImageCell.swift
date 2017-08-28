//
//  TCZTitleNextToImageCell.swift
//  Dormouse
//
//  Created by 武卓 on 2017/8/14.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import SnapKit

class TCZTitleNextToImageCell: TCZBaseTableCell {
    
    /// Change icon size
    var iconSize: CGSize = CGSize.zero {
        didSet {
            rightImageView.snp.updateConstraints { (make) in
                make.width.equalTo(iconSize.width)
                make.height.equalTo(iconSize.height)
            }
        }
    }
    
    lazy var titleLabel: UILabel  = {
        
        let label = UILabel.tczLabel()
        return label
    }()
    
    lazy var rightImageView :UIImageView = {
        
        let view = UIImageView.tczImageView()
        return view
    }()
    
    override func tczCreateBaseCellUI() {
        super.tczCreateBaseCellUI()
        
        contentView.addSubview(rightImageView)
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(kLeftEdge)
            make.centerY.equalToSuperview()
        }
        
        rightImageView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.right).offset(kItemSpace)
            make.width.equalTo(self.contentView.frame.height * 0.8)
            make.height.equalTo(self.contentView.frame.height * 0.8)
            make.centerY.equalToSuperview()
        }
    }
    
    override func tczConfigureData(aItem: TCZTableViewData) {
        
        titleLabel.text = aItem.title
        rightImageView.image = aItem.image
    }
    
}
