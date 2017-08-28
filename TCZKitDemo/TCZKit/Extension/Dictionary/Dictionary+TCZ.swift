//
//  Dictionary + TCZ.swift
//  Dormouse
//
//  Created by 武卓 on 2017/8/15.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import Foundation
//extension Dictionary where Key: ExpressibleByStringLiteral, Value:AnyObject 

extension Dictionary {
    
    public func jsonString() -> String {
        do {
            let stringData = try JSONSerialization.data(withJSONObject: self as NSDictionary, options: JSONSerialization.WritingOptions.prettyPrinted)
            if let string = String(data: stringData, encoding: String.Encoding.utf8){
                return string
            }
        } catch _ {
            return ""
        }
        return ""
    }
}
