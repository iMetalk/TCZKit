//
//  TCZBaseCell.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/13.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit
import SnapKit

class TCZBaseCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        tczCreateBaseCellUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tczConfigureData(aItem: TCZTableViewItem) {
        
    }
    
    func tczCreateBaseCellUI() {
        
    }
    
    

}
