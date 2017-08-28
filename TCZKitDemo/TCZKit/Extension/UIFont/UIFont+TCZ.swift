//
//  UIFont+TCZ.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/21.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit
import Foundation

extension UIFont {
    
    public class func tcz_systemFontWithSize(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size + self.dom_fontScaleSize())
    }
    
    public class func tcz_boldSystemFontWithSize(size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size + self.dom_fontScaleSize())
    }
    
    
    private class func dom_fontScaleSize() -> CGFloat {
        if WINDOW_HEIGHT <= 568 {
            return -2
        }else if WINDOW_HEIGHT == 736{
            return 1
        }
        return 0
    }
    
}
