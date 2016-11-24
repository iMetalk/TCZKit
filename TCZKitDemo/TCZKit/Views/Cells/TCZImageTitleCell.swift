//
//  TCZImageTitleCell.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/21.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

/*
 With a left image and a title, imageSize defalut is Cell heght * 0.8
 
 ===== title | image =========
 */

import UIKit

class TCZImageTitleCell: TCZBaseCell {
    
    
    /// Change icon size
    var iconSize: CGSize = CGSize.zero {
        didSet {
            leftImageView.snp.updateConstraints { (make) in
                make.width.equalTo(iconSize.width)
                make.height.equalTo(iconSize.height)
            }
        }
    }

    /// Title label
    lazy var titleLabel: UILabel = {
        let label = UILabel.tczLabel()
        return label
    }()
    
    /// ImageView
    lazy var leftImageView: UIImageView = {
        let view = UIImageView.tczImageView()
        return view
    }()
    
    override func tczCreateBaseCellUI() {
        super.tczCreateBaseCellUI()
        
        contentView.addSubview(leftImageView)
        contentView.addSubview(titleLabel)
        
        leftImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(TCZConstant.kLeftEdge)
            make.width.equalTo(self.contentView.frame.height * 0.8)
            make.height.equalTo(self.contentView.frame.height * 0.8)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(leftImageView.snp.right).offset(TCZConstant.kItemSpace)
            make.right.equalToSuperview().offset(-TCZConstant.kLeftEdge)
            make.centerY.equalToSuperview()
        }
    }
    
    override func tczConfigureData(aItem: TCZTableViewItem) {
        
        if let aTitle = aItem.title {
            titleLabel.text = aTitle
        }
        if let aImage = aItem.image {
            leftImageView.image = aImage
        }
    }
}
