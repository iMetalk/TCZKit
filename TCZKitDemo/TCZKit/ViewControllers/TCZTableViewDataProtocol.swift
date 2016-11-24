//
//  TCZTableViewDataProtocol.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/14.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import Foundation
import UIKit

protocol TCZTCZTableViewDataProtocol {
    
    var cellName: String{get set}
    
}

enum TCZTableViewCellType {
    case LeftTitle
    case LeftImage
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

struct TCZTableViewItem {
    let type: TCZTableViewCellType
    var title: String?
    var image: UIImage?
    var bottomTitle: String?
}
