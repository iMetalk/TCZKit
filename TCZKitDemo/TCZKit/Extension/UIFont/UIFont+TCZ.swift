//
//  UIFont+TCZ.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/21.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    /// Create system font
    ///
    /// - Parameter fontSize: the font size
    /// - Returns: UIFont
    class func tczSystemFontWitSize(fontSize: CGFloat) -> UIFont {
        let font = UIFont.systemFont(ofSize: fontSize)
        return font
    }
    
}
