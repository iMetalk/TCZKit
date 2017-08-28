//
//  String+TCZ.swift
//  Dormouse
//
//  Created by tczy on 2017/8/11.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import Foundation

extension String {
    
    /// 字符长度
    public var length: Int {
        return self.characters.count
    }
    
    /// 检查是否空白
    public var isBlank: Bool {
        let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty
    }
    
    ///去空格换行
    public mutating func trim() {
        self = self.trimmed()
    }
    
    /// string字数
    public var countofWords: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+", options: NSRegularExpression.Options())
        return regex?.numberOfMatches(in: self, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: self.length)) ?? 0
    }
    
    /// 去空格换行 返回新的字符串
    public func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    ///  json 字符转字典
    public func toDictionary() -> [String:AnyObject]? {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: [JSONSerialization.ReadingOptions.init(rawValue: 0)]) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
    
    /// String to Int
    public func toInt() -> Int? {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        } else {
            return nil
        }
    }
    
    /// String to Double
    public func toDouble() -> Double? {
        if let num = NumberFormatter().number(from: self) {
            return num.doubleValue
        } else {
            return nil
        }
    }
    
    /// String to Float
    public func toFloat() -> Float? {
        if let num = NumberFormatter().number(from: self) {
            return num.floatValue
        } else {
            return nil
        }
    }
    
    /// String to Bool
    public func toBool() -> Bool? {
        let trimmedString = trimmed().lowercased()
        if trimmedString == "true" || trimmedString == "false" {
            return (trimmedString as NSString).boolValue
        }
        return nil
    }
    
    ///  String to NSString
    public var toNSString: NSString { return self as NSString }
    
    ///字符串高度
    public func height(_ width: CGFloat, font: UIFont, lineBreakMode: NSLineBreakMode?) -> CGFloat {
        var attrib: [String: AnyObject] = [NSFontAttributeName: font]
        if lineBreakMode != nil {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = lineBreakMode!
            attrib.updateValue(paragraphStyle, forKey: NSParagraphStyleAttributeName)
        }
        let size = CGSize(width: width, height: CGFloat(Double.greatestFiniteMagnitude))
        return ceil((self as NSString).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:attrib, context: nil).height)
    }
    
//    /// MD5
//    ///
//    /// - Returns: MD5
//    func md5() -> String {
//        let str = self.cString(using: String.Encoding.utf8)
//        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
//        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
//        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
//        
//        CC_MD5(str!, strLen, result)
//        let hash = NSMutableString()
//        for i in 0 ..< digestLen {
//            hash.appendFormat("%02x", result[i])
//        }
//        
//        result.deallocate(capacity: digestLen)
//        
//        return String(format: hash as String)
//    }
    
    
    /// 是否为正确的是手机号
    ///
    /// - Parameter phone: 手机号
    /// - Returns: 是否正确
    static func isValidPhone (phone:String)->(Bool){
        
        let str = "^[1-9][0-9]{4,11}$"
        
        let mobilePredicate = NSPredicate(format: "SELF MATCHES %@",str)
        
        return mobilePredicate.evaluate(with: phone)
    }
    
    /// 千分符 1，000格式
    ///
    /// - Parameter str: 数字
    /// - Returns: 1，000
    static func calcuteSymbolLocation(str: String) -> String {
        
        var resultStr = str
        
        let symbolStr = "."
        
        let subRange = (resultStr as NSString).range(of: symbolStr)
        
        
        if subRange.location == 4  || subRange.location == 5 {
            
            resultStr.insert(",", at: str.index(resultStr.startIndex, offsetBy: 1))
        }
        
        return resultStr
        
    }
    
    /// 清除字符串小数点末尾的0
    func cleanDecimalPointZear() -> String {
        let newStr = self as NSString
        var s = NSString()
        
        var offset = newStr.length - 1
        while offset > 0 {
            s = newStr.substring(with: NSMakeRange(offset, 1)) as NSString
            if s.isEqual(to: "0") || s.isEqual(to: ".") {
                offset -= 1
            } else {
                break
            }
        }
        return newStr.substring(to: offset + 1)
    }
    
    /// 判断是否为合法的身份证号
    ///
    /// - Parameter sfz: 身份证
    /// - Returns: 是否合法
    static func isValidateIDCardNumber(sfz:String)->(Bool){
        
        let value = sfz.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        var length = 0
        if value == "" {
            
            return false
        }else{
            
            length = value.characters.count
            if length != 15 && length != 18 {
                return false
            }
        }
        
        //省份代码
        let arearsArray = ["11","12", "13", "14",  "15", "21",  "22", "23",  "31", "32",  "33", "34",  "35", "36",  "37", "41",  "42", "43",  "44", "45",  "46", "50",  "51", "52",  "53", "54",  "61", "62",  "63", "64",  "65", "71",  "81", "82",  "91"]
        let valueStart2 = (value as NSString).substring(to: 2)
        var arareFlag = false
        
        if arearsArray.contains(valueStart2) {
            
            arareFlag = true
        }
        if !arareFlag{
            return false
        }
        
        var regularExpression = NSRegularExpression()
        var numberofMatch = Int()
        var year = 0
        
        switch (length) {
        case 15:
            year = Int((value as NSString).substring(with: NSRange(location:6,length:2)))!
            if year%4 == 0 || (year%100 == 0 && year%4 == 0){
                do{
                    regularExpression = try NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$", options: .caseInsensitive) //检测出生日期的合法性
                    
                }catch{
                    
                    
                }
                
                
            }else{
                do{
                    regularExpression =  try NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$", options: .caseInsensitive) //检测出生日期的合法性
                    
                }catch{}
            }
            
            numberofMatch = regularExpression.numberOfMatches(in: value, options:NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, value.characters.count))
            
            if(numberofMatch > 0) {
                return true
            }else {
                return false
            }
            
        case 18:
            year = Int((value as NSString).substring(with: NSRange(location:6,length:4)))!
            if year%4 == 0 || (year%100 == 0 && year%4 == 0){
                do{
                    regularExpression = try NSRegularExpression.init(pattern: "^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$", options: .caseInsensitive) //检测出生日期的合法性
                    
                }catch{
                    
                }
            }else{
                do{
                    regularExpression =  try NSRegularExpression.init(pattern: "^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$", options: .caseInsensitive) //检测出生日期的合法性
                    
                }catch{}
            }
            
            numberofMatch = regularExpression.numberOfMatches(in: value, options:NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, value.characters.count))
            
            if(numberofMatch > 0) {
                let s =
                    (Int((value as NSString).substring(with: NSRange(location:0,length:1)))! +
                        Int((value as NSString).substring(with: NSRange(location:10,length:1)))!) * 7 +
                        (Int((value as NSString).substring(with: NSRange(location:1,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:11,length:1)))!) * 9 +
                        (Int((value as NSString).substring(with: NSRange(location:2,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:12,length:1)))!) * 10 +
                        (Int((value as NSString).substring(with: NSRange(location:3,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:13,length:1)))!) * 5 +
                        (Int((value as NSString).substring(with: NSRange(location:4,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:14,length:1)))!) * 8 +
                        (Int((value as NSString).substring(with: NSRange(location:5,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:15,length:1)))!) * 4 +
                        (Int((value as NSString).substring(with: NSRange(location:6,length:1)))! +
                            Int((value as NSString).substring(with: NSRange(location:16,length:1)))!) *  2 +
                        Int((value as NSString).substring(with: NSRange(location:7,length:1)))! * 1 +
                        Int((value as NSString).substring(with: NSRange(location:8,length:1)))! * 6 +
                        Int((value as NSString).substring(with: NSRange(location:9,length:1)))! * 3
                
                let Y = s%11
                var M = "F"
                let JYM = "10X98765432"
                
                M = (JYM as NSString).substring(with: NSRange(location:Y,length:1))
                if M == (value as NSString).substring(with: NSRange(location:17,length:1))
                {
                    return true
                }else{return false}
                
                
            }else {
                return false
            }
            
        default:
            return false
        }
    }
    
}

