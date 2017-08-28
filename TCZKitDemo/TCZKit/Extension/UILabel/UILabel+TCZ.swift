//
//  UILabel+TCZ.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/13.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit

extension UILabel {
    
    /// Create label
    ///
    /// - Parameters:
    ///   - text: The label text
    ///   - font: The label font
    /// - Returns: UILabel
    class func tczLabel(text: String?, font: UIFont?, color: UIColor?) -> UILabel {
        
        let label = UILabel()
        if let aText = text {
            label.text = aText;
        }
        if let aFont = font {
            label.font = aFont;
        }else{
            label.font = UIFont.tcz_systemFontWithSize(size: kTitleFontSize)
        }
        if let aColor = color {
            label.textColor = aColor
        }else{
            label.textColor = UIColor.black
        }
        return label
    }
    
    /// Create labe not contain text and font
    ///
    /// - Returns: UILable
    class func tczLabel() -> UILabel {
        
        return self.tczLabel(text: nil, font: nil, color: nil)
    }
    
}
