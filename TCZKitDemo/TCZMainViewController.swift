//
//  TCZMainViewController.swift
//  TCZKitDemo
//
//  Created by WangSuyan on 2016/11/29.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit
import Foundation

class TCZMainViewController: TCZBaseTableViewController {

    let titles = ["TCZPlainViewController", "TCZGroupViewController"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TCZKit"
        
        loadData(isGroup: false)
    }
    
    override func configureData() {
        super.configureData()
        for atitle in titles {
            var item = TCZTableViewItem(type: .LeftTitle)
            item.title = atitle
            
            dataArray.append(item)
            cellIndentifierSet.insert(item.type.cellName)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item: TCZTableViewItem = dataArray[indexPath.row] as! TCZTableViewItem
        navigationController?.pushViewController(NSObject.fromClassName(className: item.title!) as! UIViewController, animated: true)
        
    }
}


extension NSObject {
    class func fromClassName(className : String) -> NSObject {
        let className = Bundle.main.infoDictionary!["CFBundleName"] as! String + "." + className
        let aClass = NSClassFromString(className) as! UIViewController.Type
        return aClass.init()
    }
}
