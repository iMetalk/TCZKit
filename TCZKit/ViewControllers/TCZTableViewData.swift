//
//  TCZTableViewData.swift
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


/// If you want to use custom data model, you should implete TCZTableViewData
protocol TCZTableViewData {
    
    /// The cell bottom title
    var bottomTitle: String? { get }
    
    /// The cell image
    var image: UIImage? { get }
    
    /// The cell title
    var title: String? { get }
    
    /// The cell type
    var type: TCZTableViewCellType { get }
    
    /// The cell height
    var cellHeight: CGFloat { get }
}

extension TCZTableViewData {
    
    var cellHeight: CGFloat {
        return TCZConstant.kRowHeight
    }
    
    var bottomTitle: String? {
        return nil
    }
    
    var title: String? {
        return nil
    }
    
    var image: UIImage? {
        return nil
    }
}


/// TableView dataSource, you must use TCZTableViewItem as tableView dataSouce
struct TCZTableViewItem: TCZTableViewData {
    /// The cell bottom title
    var bottomTitle: String?

    /// The cell image
    var image: UIImage?

    /// The cell title
    var title: String?

    /// The cell type
    var type: TCZTableViewCellType
    
    init(type: TCZTableViewCellType) {
        self.type = type
    }

}


/// TableView section view type
enum TCZSectionType {
    case Title
    
    var sectionViewName: String {
        switch self {
        case .Title:
            return NSStringFromClass(TCZSectionTitleView.self)
        }
    }
}
