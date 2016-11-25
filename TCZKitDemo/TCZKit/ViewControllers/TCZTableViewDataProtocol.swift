//
//  TCZTableViewDataProtocol.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/14.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import Foundation
import UIKit


/// TableView cell type
enum TCZTableViewCellType {
    
    // TCZLeftTitleCell
    case LeftTitle
    // 
    case LeftImage
    // TCZImageTitleCell
    case LeftImageTitle
    case LeftAndBottomTitle
    
    var cellName: String {
        switch self {
        case .LeftTitle:
            return NSStringFromClass(TCZLeftTitleCell.self)
            
        case .LeftImageTitle:
            return NSStringFromClass(TCZImageTitleCell.self)
            
        default:
            return ""
        }
    }
}


/// TableView dataSource, you must use TCZTableViewItem as tableView dataSouce
struct TCZTableViewItem {
    // Cell type
    let type: TCZTableViewCellType
    // The left title
    var title: String?
    // The left image
    var image: UIImage?
    // The bottom title
    var bottomTitle: String?
}
