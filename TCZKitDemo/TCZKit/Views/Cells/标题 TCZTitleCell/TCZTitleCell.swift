//
//  TCZTitleCell.swift
//  Dormouse
//
//  Created by tczy on 2017/8/14.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import Foundation

class TCZTitleCell: TCZBaseTableCell {
    
    
    /// Title label
    lazy var titleLabel: UILabel = {
        
        let label = UILabel.tczLabel()
        return label
    }()
    
    override func tczCreateBaseCellUI() {
        
        accessoryType = .disclosureIndicator
        
        // Title label
        contentView.addSubview(self.titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(kLeftEdge)
            make.right.equalToSuperview().offset(-kLeftEdge)
            make.centerY.equalToSuperview()
        }
    }
    
    override func tczConfigureData(aItem: TCZTableViewData) {
        
        titleLabel.text = aItem.title
    }
    
}
