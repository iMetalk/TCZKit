//
//  UIView+TCZ.swift
//  Dormouse
//
//  Created by tczy on 2017/8/11.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import Foundation

extension UIView{
    
    var TCZ_x : CGFloat {
        get {
            return frame.origin.x
        }
        
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.origin.x     = newVal
            frame                 = tmpFrame
        }
    }
    
    var TCZ_y : CGFloat {
        get {
            return frame.origin.y
        }
        
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.origin.y     = newVal
            frame                 = tmpFrame
        }
    }
    
    var TCZ_left: CGFloat {
        get {
            return TCZ_x
        }
        
        set(newVal) {
            TCZ_x = newVal
        }
    }
    
    var TCZ_right: CGFloat {
        get {
            return TCZ_x + TCZ_width
        }
        
        set(newVal) {
            TCZ_x = newVal - TCZ_width
        }
    }
    
    var TCZ_top: CGFloat {
        get {
            return TCZ_y
        }
        
        set(newVal) {
            TCZ_y = newVal
        }
    }
    
    var TCZ_bottom: CGFloat {
        get {
            return TCZ_y + TCZ_height
        }
        
        set(newVal) {
            TCZ_y = newVal - TCZ_height
        }
    }
    
    var TCZ_width: CGFloat {
        get {
            return self.bounds.width
        }
        
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.size.width   = newVal
            frame                 = tmpFrame
        }
    }
    
    var TCZ_height: CGFloat {
        get {
            return self.bounds.height
        }
        
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.size.height  = newVal
            frame                 = tmpFrame
        }
    }
    
    var TCZ_centerX : CGFloat {
        get {
            return center.x
        }
        
        set(newVal) {
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    
    var TCZ_centerY : CGFloat {
        get {
            return center.y
        }
        
        set(newVal) {
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    var TCZ_middleX : CGFloat {
        get {
            return TCZ_width / 2
        }
    }
    
    var TCZ_middleY : CGFloat {
        get {
            return TCZ_height / 2
        }
    }
    
    var TCZ_middlePoint : CGPoint {
        get {
            return CGPoint(x: TCZ_middleX, y: TCZ_middleY)
        }
    }
    
}
