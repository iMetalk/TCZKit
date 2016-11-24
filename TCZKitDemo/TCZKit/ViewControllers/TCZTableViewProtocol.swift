//
//  TCZTableViewProtocol.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/14.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit

protocol TCZTableViewProtocol {
    
    func cellForIndexPath(cellName: String, indexPath: NSIndexPath) -> UITableViewCell;
}
