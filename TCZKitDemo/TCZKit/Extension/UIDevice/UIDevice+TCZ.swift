//
//  UIDevice+TCZ.swift
//  Dormouse
//
//  Created by tczy on 2017/8/14.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import Foundation

extension UIDevice {
    
    /// 设备的名称
    ///
    /// - Returns: 设备名
    class func tcz_deviceAlias() -> String {
        let device = UIDevice()
        return device.name
    }
    
}
