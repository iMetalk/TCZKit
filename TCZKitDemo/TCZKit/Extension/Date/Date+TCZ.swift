//
//  Date+TCZ.swift
//  Dormouse
//
//  Created by tczy on 2017/8/11.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import Foundation

extension Date {
    
    /// 根据时间戳转换时间
    ///
    /// - Parameter timeStamp: 时间戳
    /// - Returns: date
    static func dateWithTimeStamp(timeStamp: Double) -> Date {
        var aTimeStamp = timeStamp
        if timeStamp > 140000000000 {
            aTimeStamp = aTimeStamp / 1000.0
        }
        return Date(timeIntervalSince1970: aTimeStamp)
    }
    
    /// 生成timeStamp
    ///
    /// - Returns: timeStampString
    func timeStamp() -> String {
        let timeStamp = Int(self.timeIntervalSince1970 * 1000.0)
        return String(timeStamp)
    }
    
    /// 获取天数索引
    ///
    /// - Returns: 天数
    func dayIndexSince1970() -> Int {
        let interval = self.changeZone().timeIntervalSince1970
        return Int(interval / Double((24 * 60 * 60)))
    }
    
    /// 获取指定时间距今多少天
    ///
    /// - Returns: 天数
    func dayIndexSinceNow() -> Int {
        return self.dayIndexSinceDate(date: Date())
    }
    
    /// 返回月份的字符串
    ///
    /// - Returns: monthString
    func monthString() -> String {
        let chinaseMonth = ["", "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
        let monthIndex = self.allDateComponent().month ?? 0
        guard monthIndex < 0, monthIndex > 12 else {
            return chinaseMonth[monthIndex]
        }
        return ""
    }
    
    /// 获取字符串
    ///
    /// - Returns: timeString
    func string() -> String {
        return self.stringWithDateFormat(dateFormat: "yyyy-MM-dd HH:mm:ss")
    }
    
    /// 获取不带秒数的字符串
    ///
    /// - Returns: timeString
    func stringWithNoSeconds() -> String {
        return self.stringWithDateFormat(dateFormat: "yyyy-MM-dd HH:mm")
    }
    
    /// //格式化日期 精确到天
    ///
    /// - Returns: date
    func dateAccurateToDay() -> Date? {
        return self.dateAccurate(components: Set(arrayLiteral: .year,.month,.day))
    }
    
    /// 格式化日期 精确到小时
    ///
    /// - Returns: date
    func dateAccurateToHour() -> Date? {
        return self.dateAccurate(components: Set(arrayLiteral: .year,.month,.day,.hour))
    }
    
    func age() -> Int {
        guard self.isValidDate() else {
            return 0
        }
        //出生年月日
        let bornCompontens = self.allDateComponent()
        let bornYear = bornCompontens.year ?? 0
        let bornMonth = bornCompontens.month ?? 0
        let bornDay = bornCompontens.month ?? 0
        
        //系统时间年月日
        let currentDateCompontens = Date().allDateComponent()
        let currentYear = currentDateCompontens.year ?? 0
        let currentMonth = currentDateCompontens.month ?? 0
        let currentDay = currentDateCompontens.day ?? 0
        
        //计算年龄
        var age = currentYear - bornYear - 1
        
        if (currentMonth > bornMonth) || (currentMonth == bornMonth && currentDay >= bornDay) {
            age += 1
        }
        return age
    }
    
}


//MARK:helper
extension Date {
    
    /// 获取指定时间之间的天数
    ///
    /// - Parameter date: 指定时间
    /// - Returns: 天数
    func dayIndexSinceDate(date: Date) -> Int {
        var days = 0
        let baseBegin = date.dateAccurateToDay()
        let lastBegin = self.dateAccurateToDay()
        guard let aBaseBegin = baseBegin, let aLastBegin = lastBegin else {
            return 0
        }
        days = String(format: ".0f", aLastBegin.timeIntervalSince(aBaseBegin)).toInt() ?? 0
        return days
    }
    
    /// 按照指定formatter格式化date
    ///
    /// - Parameter dateFormat: formatter 如:yyyy-MM-dd HH:mm:ss
    /// - Returns: timeString
    func stringWithDateFormat(dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
    
    /// 格式化日期
    ///
    /// - Parameter components: 精度
    /// - Returns: date
    func dateAccurate(components: Set<Calendar.Component>) -> Date? {
        var current: Date?
        let calendar = NSCalendar.current
        let aComponents = calendar.dateComponents(components, from: self)
        current =  calendar.date(from: aComponents)
        guard let aCurrent = current else {
            return nil
        }
        return aCurrent
    }
    
    //获取components
    func allDateComponent() -> DateComponents {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents(Set(arrayLiteral: .year,.month,.day,.hour,.minute,.second,.weekday), from: self)
        return components
    }
    
    //加上时区偏移
    func changeZone() -> Date {
        let zone = NSTimeZone.system
        let interval = zone.secondsFromGMT(for: self as Date)
        return self.addingTimeInterval(TimeInterval(interval))
    }
    
    /// 判断时间是否有效
    ///
    /// - Returns: bool
    func isValidDate() -> Bool {
        let bornCompontens = self.allDateComponent()
        guard bornCompontens.isValidDate else {
            return false
        }
        return true
    }
    
}
