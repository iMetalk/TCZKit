//
//  TCZImageTitleBottomSubtitleCell.swift
//  Dormouse
//
//  Created by tczy on 2017/8/14.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit

class TCZImageTitleBottomSubtitleCell: TCZBaseTableCell {

    override func tczConfigureData(aItem: TCZTableViewData) {
        
        imgView.image = aItem.image
        titleLabel.text = aItem.title
        subtitleLabel.text = aItem.bottomTitle
    }
    
    override func tczCreateBaseCellUI() {
        
        contentView.addSubview(imgView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        imgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(kLeftEdge)
            make.width.equalTo(self.contentView.frame.height * 0.8)
            make.height.equalTo(self.contentView.frame.height * 0.8)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imgView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-kLeftEdge)
            make.bottom.equalTo(contentView.snp.centerY)
        }
        
        subtitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imgView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-kLeftEdge)
            make.top.equalTo(contentView.snp.centerY).offset(2)
        }
    }
    
    lazy var imgView: UIImageView = {
        
        let image = UIImageView.tczImageView()
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel.tczLabel()
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        
        let label = UILabel.tczLabel(text: nil, font: UIFont.tcz_systemFontWithSize(size: 13), color: UIColor.gray)
        return label
    }()

}
