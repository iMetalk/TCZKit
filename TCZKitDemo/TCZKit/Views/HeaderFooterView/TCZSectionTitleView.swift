//
//  TCZSectionTitleView.swift
//  TCZKitDemo
//
//  Created by WangSuyan on 2016/11/27.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit

class TCZSectionTitleView: UITableViewHeaderFooterView {

    lazy var titleButton: UIButton = {
        let button = UIButton.tczButton(bgImage: nil)
        button.setTitleColor(UIColor.black, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: TCZConstant.kLeftEdge, bottom: 0, right: TCZConstant.kLeftEdge)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    var title: String? {
        didSet{
            titleButton.setTitle(title, for: .normal)
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureSectionView()
    }
    
    private func configureSectionView() {
        contentView.addSubview(titleButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleButton.frame = self.contentView.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
