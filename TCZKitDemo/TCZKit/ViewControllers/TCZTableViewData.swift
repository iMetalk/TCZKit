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
    
    //1、标题 TCZTitleCell
    case Title
    //2、标题+图片 TCZTitleImageCell
    case TitleImage
    //3、标题+开关 TCZTitleSwitchCell
    case TitleSwitch
    //4、图标+标题 TCZImageTitleCell
    case ImageTitle
    //5、输入框 TCZTextFieldCell
    case TextField
    //6、标题+输入框 TCZTitleTextFieldCell
    case TitleTextField
    //7、标题+输入框+图标 TCZTitleTextFieldImageCell
    case TitleTextFieldImage
    //8、标题+右子标题 TCZTitleRightSubtitleCell
    case TitleRightSubtitle
    //9、图标+标题+右子标题 TCZImageTitleRightSubtitleCell
    case ImageTitleRightSubtitle
    //10、标题+下子标题 TCZTitleBottomSubtitleCell
    case TitleBottomSubtitle
    //11、图标+标题+下子标题 TCZImageTitleBottomSubtitleCell
    case ImageTitleBottomSubtitle
    //12、标题+紧挨标题的图标 TCZTitleNextToImageCell
    case TitleNextToImage
    //其他
    case Other
    

    var cellName: String {
        switch self {
        case .Title:
            return NSStringFromClass(TCZTitleCell.self)
            
        case .TitleImage:
            return NSStringFromClass(TCZTitleImageCell.self)
            
        case.TitleSwitch:
            return NSStringFromClass(TCZTitleSwitchCell.self)
            
        case.ImageTitle:
            return NSStringFromClass(TCZImageTitleCell.self)
            
        case .TextField:
            return NSStringFromClass(TCZTextFieldCell.self)
            
        case .TitleTextField:
            return NSStringFromClass(TCZTitleTextFieldCell.self)
            
        case .TitleTextFieldImage:
            return NSStringFromClass(TCZTitleTextFieldImageCell.self)
            
        case .TitleRightSubtitle:
            return NSStringFromClass(TCZTitleRightSubtitleCell.self)
            
        case .ImageTitleRightSubtitle:
            return NSStringFromClass(TCZImageTitleRightSubtitleCell.self)
            
        case .TitleBottomSubtitle:
            return NSStringFromClass(TCZTitleBottomSubtitleCell.self)
            
        case .ImageTitleBottomSubtitle:
            return NSStringFromClass(TCZImageTitleBottomSubtitleCell.self)
            
        case .TitleNextToImage:
            return NSStringFromClass(TCZTitleNextToImageCell.self)
            
        default:
            return NSStringFromClass(TCZBaseTableCell.self)
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
    
    /// The cell right title
    var rightTitle: String? {get set}
    
    /// The cell type
    var type: TCZTableViewCellType { get }
    
    /// The cell height
    var cellHeight: CGFloat { get }
}


extension TCZTableViewData {
    
    var cellHeight: CGFloat {
        return kRowHeight
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
    /// The cell right title
    var rightTitle: String?

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
