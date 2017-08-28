//
//  UIColor+TCZ.swift
//  Dormouse
//
//  Created by tczy on 2017/8/11.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    
    //RGB进制颜色值
    public static func RGBCOLOR(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0);
    }
    
    //RGBA进制颜色值
    public static func RGBACOLOR(r: CGFloat, g: CGFloat, b: CGFloat, a:CGFloat) -> UIColor {
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a);
    }
    
    //16进制颜色值，如：#000000 , 注意：在使用的时候hexValue写成：0x000000
    public static func HexColor(hexValue: UInt) -> UIColor {
        return UIColor.init(red: ((CGFloat)(((hexValue) & 0xFF0000) >> 16))/255.0, green: ((CGFloat)(((hexValue) & 0xFF00) >> 8))/255.0, blue: ((CGFloat)((hexValue) & 0xFF))/255.0, alpha: 1.0)
    }
    
    //16进制颜色值
    public static func HexAColor(hexValue: UInt, a:CGFloat) -> UIColor {
        return UIColor.init(red: ((CGFloat)(((hexValue) & 0xFF0000) >> 16))/255.0, green: ((CGFloat)(((hexValue) & 0xFF00) >> 8))/255.0, blue: ((CGFloat)((hexValue) & 0xFF))/255.0, alpha: a)
    }
    
}
