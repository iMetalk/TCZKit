//
//  TCZConstant.swift
//  Dormouse
//
//  Created by tczy on 2017/8/11.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import Foundation

//屏幕宽高
public let WINDOW_WIDTH = UIScreen.main.bounds.size.width
public let WINDOW_HEIGHT = UIScreen.main.bounds.size.height

//屏幕宽高比
public let WINDOW_WIDTH_SCALE = UIScreen.main.bounds.size.width / 375
public let WINDOW_HEIGHT_SCALE = UIScreen.main.bounds.size.height / 667

//按当前屏幕宽高比适配后的宽度和高度
public func SCALE_WIDTH(width:CGFloat) -> CGFloat {
    return UIScreen.main.bounds.size.width / 375 * width
}
public func SCALE_HEIGHT(height:CGFloat) -> CGFloat {
    return UIScreen.main.bounds.size.width / 667 * height
}


/// default edge to left or right
public let kLeftEdge: CGFloat = 14

/// item edge
public let kItemSpace: CGFloat = 8

/// tabBar height
public let kTabBarHeight: CGFloat = 49

/// naviBar height
public let kNaviBarHeight: CGFloat = 44

/// statusBar height
public let kStatusBarHeight: CGFloat = 20


/// default TableView footer height
public let kFooterHeight: CGFloat = 120

/// default tableView section header height
public let kSectionHeaderHeight: CGFloat = 8

/// default tableView section header title height
public let kSectionTitleHeight: CGFloat = 50

/// default tableView cell height
public let kRowHeight: CGFloat = 44

/// default big button height
public let kBigButtonHeight: CGFloat = 45


/// Default font size
public let kTitleFontSize: CGFloat = 15

/// Default font size
public let kButtonFontSize: CGFloat = 16


