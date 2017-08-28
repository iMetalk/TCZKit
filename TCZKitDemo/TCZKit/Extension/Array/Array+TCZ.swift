//
//  Array+TCZ.swift
//  Dormouse
//
//  Created by 武卓 on 2017/8/15.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import Foundation

extension Array {
    
    ///JsonStr
    public func jsonString() -> String {
        var result:String = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            
            if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                result = JSONString
            }
            
        } catch {
            result = ""
        }
        return result
    }
}
