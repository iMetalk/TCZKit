//
//  TCZTitleTextFieldImageCell.swift
//  Dormouse
//
//  Created by 田向阳 on 2017/8/11.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit

class TCZTitleTextFieldImageCell: TCZTitleTextFieldCell {

    override func tczConfigureData(aItem: TCZTableViewData) {
        titleLabel.text = aItem.title
        
        rightImageView.image = aItem.image
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: createUI
    func createSubUI() {
        contentView.addSubview(rightImageView)
        rightImageView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-kLeftEdge)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        textField.snp.remakeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.right).offset(kLeftEdge)
            make.bottom.top.equalToSuperview()
            make.right.equalTo(rightImageView.snp.left).offset(-kLeftEdge)
        }
    }
    
    //MARK:lazy
    lazy var rightImageView: UIImageView = {
    let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
    return imageView
    }()
}
