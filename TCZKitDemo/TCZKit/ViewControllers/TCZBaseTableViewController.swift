//
//  TCZBaseTableViewController.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/13.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit


class TCZBaseTableViewController: UIViewController {
    
    var tableView: UITableView!
    var isGroup = false
    var dataArray = [TCZTableViewItem]()
    var groupDataArray = [Array<TCZTableViewItem>]()
    var cellSet = NSMutableSet()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white        
    }
    
    // SubClass must impleation this method
    func loadData(isGroup: Bool) {
        self.isGroup = isGroup
        createUI()
        configureData()
        registerCells()
        tableView.reloadData()
    }
    
    func configureData() {
        
    }
    
    // MARK: Private
    private func registerCells() {
        for cellName in cellSet {
            if let aCellName = cellName as? String {
                tableView.register(NSClassFromString(aCellName), forCellReuseIdentifier: aCellName)
            }
        }
    }
    
    
    // MARK - CreateUI
    private func createUI() {
        tableView = UITableView.tczTableView(frame: self.view.bounds, isGroup: isGroup)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ID")
        view.addSubview(tableView)
    }

}

extension TCZBaseTableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if isGroup {
            return groupDataArray.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isGroup {
            return groupDataArray[section].count
        }
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aItem: TCZTableViewItem!
        if isGroup {
            aItem = groupDataArray[indexPath.section][indexPath.row]
        }else{
            aItem = dataArray[indexPath.row]
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: aItem.type.cellName, for: indexPath)
        if let baseCell = cell as? TCZBaseCell{
            baseCell.tczConfigureData(aItem: aItem)
            
            tczCellReuse(cell: baseCell, atIndexPath: indexPath, item: aItem)
        }
        
        
        return cell
    }
    
    func tczCellReuse(cell: TCZBaseCell, atIndexPath: IndexPath, item: TCZTableViewItem) {
        
    }
}
