//
//  TCZTitleSwitchCell.swift
//  Dormouse
//
//  Created by 武卓 on 2017/8/11.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import SnapKit

class TCZTitleSwitchCell: TCZBaseTableCell {
    
    lazy var titleLabel: UILabel  = {
        
        let label = UILabel.tczLabel()
        return label
    }()
    
    lazy var aSwitch: UISwitch = {
        
        let aSwh = UISwitch()
        aSwh.isOn = true
        return aSwh
    }()
    
    override func tczCreateBaseCellUI() {
        super.tczCreateBaseCellUI()
        contentView.addSubview(titleLabel)
        contentView.addSubview(aSwitch)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(kLeftEdge)
            make.right.equalTo(aSwitch.snp.left).offset(-kItemSpace)
            make.centerY.equalToSuperview()
        }
        
        aSwitch.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-kLeftEdge)
            make.centerY.equalToSuperview()
            
        }
    }
    
    override func tczConfigureData(aItem: TCZTableViewData) {
        titleLabel.text = aItem.title
        
    }
    
}
