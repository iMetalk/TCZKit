//
//  TCZActionView.swift
//  TCZKitDemo
//
//  Created by WangSuyan on 2016/11/25.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit

private let kItemHeight: CGFloat = 50

class TCZActionView: UIView {
    
    var button: UIButton!
    var actionClick: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureActionView()
    }
    
    func buttonDidClick(){
        actionClick?()
    }
    
    func configureActionView() {
        button = UIButton.tczButton(bgImage: UIImage(named: "redBg"))
        
        button.addTarget(self, action:  #selector(TCZActionView.buttonDidClick), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.height.equalTo(kItemHeight)
            make.left.equalTo(TCZConstant.kLeftEdge)
            make.right.equalTo(-TCZConstant.kLeftEdge)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
