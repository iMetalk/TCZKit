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
    
    
    /// TableView is pain or group
    var isGroup = false
    
    /// If you set more than 0, tableView will automatic calculation height
    var estimatedRowHeight: CGFloat = 0
    
    /// If tableView is plain, you must user dataArray, or you must use groupDataArray, as tableView dataSource
    var dataArray = [TCZTableViewItem]()
    var groupDataArray = [Array<TCZTableViewItem>]()
    
    /// You should set cellIndentifierSet when you configure tableView dataSource, this will use to register cell to tableView. You should use cell name as the cell indentifier
    var cellIndentifierSet: Set<String> = []
    
    
    /// TableView footer delegate, if you set footerDelegate, the tableView will have a footer
    var footerDelegate: TCZTableViewFooterable?
    
    /// TableView header delegate, if you set headerDelegate, the tableView will have a header
    var headerDelegate: TCZTableViewHeaderable?
    
    
    /// TableViewCell height, default is 44, you can change this
    var rowHeight: CGFloat = TCZConstant.kRowHeight
    
    
    // MARK: ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    // MARK: Public
    // SubClass must impleation this method
    func loadData(isGroup: Bool) {
        self.isGroup = isGroup
        createUI()
        configureData()
        registerCells()
        tableView.reloadData()
    }
    
    func configureData() {
        // Configure tableView footer
        if let aFooterDelegate = footerDelegate {
            self.tableView.tableFooterView = aFooterDelegate.footerView()
        }
        
        // Configure tableView header
        if let aHeaderDelegate = headerDelegate {
            self.tableView.tableHeaderView = aHeaderDelegate.headerView()
        }
    }
    
    // MARK: Private
    private func registerCells() {
        for cellName in cellIndentifierSet {
           tableView.register(NSClassFromString(cellName), forCellReuseIdentifier: cellName)
        }
    }
    
    
    // MARK - CreateUI
    private func createUI() {
        tableView = UITableView.tczTableView(frame: self.view.bounds, isGroup: isGroup)
        tableView.delegate = self
        tableView.dataSource = self
        if estimatedRowHeight > 0 {
            tableView.estimatedRowHeight = estimatedRowHeight
            tableView.rowHeight = UITableViewAutomaticDimension
        }
        else{
            tableView.rowHeight = rowHeight
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tczCellReuse(cell: TCZBaseCell, atIndexPath: IndexPath, item: TCZTableViewItem) {
        
    }
}
