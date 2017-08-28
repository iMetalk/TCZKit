//
//  TCZBaseTableViewController.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/13.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit

class TCZBaseTableViewController: TCZBaseViewController {
    
    var tableView: UITableView!
    
    /// TableView is pain or group
    var isGroup = false
    
    /// If you set more than 0, tableView will automatic calculation height
    var estimatedRowHeight: CGFloat = 0
    
    /// TableView header section height, if the value is more than zero, it will have header sectionView
    var headerSectionHeight: CGFloat = 0
    
    /// TableView header sectionView type
    var headerSectionType: TCZSectionType = .Title
    
    /// TableView footer section height, if the value is more than zero, it will have footer sectionView
    var footerSectionHeight: CGFloat = 0
    
    /// TableView footer sectionView type
    var footerSectionType: TCZSectionType = .Title
    
    /// Is open edit mode delete
    var isOpendDelete: Bool = false
    
    /// If tableView is plain, you must use dataArray, or you must use groupDataArray, as tableView dataSource
    var dataArray = [TCZTableViewData]()
    var groupDataArray = [Array<TCZTableViewData>]()
    
    /// You should set cellIndentifierSet when you configure tableView dataSource, this will use to register cell to tableView. You should use cell name as the cell indentifier
    var cellIndentifierSet: Set<String> = []
    
    
    /// TableView footer delegate, if you set footerDelegate, the tableView will have a footer
    var footerDelegate: TCZTableViewFooterable?
    
    /// TableView header delegate, if you set headerDelegate, the tableView will have a header
    var headerDelegate: TCZTableViewHeaderable?
    
    
    // MARK: - ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    // MARK: - Public
    // SubClass must impleation this method
    func loadData(isGroup: Bool) {
        self.isGroup = isGroup
        createUI()
        configureData()
        registerCells()
        registerSectionView()
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
    
    // MARK: - Private
    private func registerCells() {
        for cellName in cellIndentifierSet {
           tableView.register(NSClassFromString(cellName), forCellReuseIdentifier: cellName)
        }
    }
    
    private func registerSectionView() {
        guard headerSectionHeight > 0 else {
            return
        }
    tableView.register(NSClassFromString(headerSectionType.sectionViewName), forHeaderFooterViewReuseIdentifier: headerSectionType.sectionViewName)
        
        guard footerSectionHeight > 0 else {
            return
        }
        
        guard headerSectionType != footerSectionType else {
            return
        }
    tableView.register(NSClassFromString(footerSectionType.sectionViewName), forHeaderFooterViewReuseIdentifier: footerSectionType.sectionViewName)
    }
    
    // MARK: - CreateUI
    private func createUI() {
        tableView = UITableView.tczTableView(frame: self.view.bounds, isGroup: isGroup)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        if estimatedRowHeight > 0 {
            tableView.estimatedRowHeight = estimatedRowHeight
            tableView.rowHeight = UITableViewAutomaticDimension
        }
        view.addSubview(tableView)
        
        self.updateTableViewConstraint()
    }
    
    func updateTableViewConstraint() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
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
        
        let aItem: TCZTableViewData = dataAtIndexPath(indexPath: indexPath)

        let cell = tableView.dequeueReusableCell(withIdentifier: aItem.type.cellName, for: indexPath)
        if let baseCell = cell as? TCZBaseTableCell{
            baseCell.tczConfigureData(aItem: aItem)
            
            tczCellReuse(cell: baseCell, atIndexPath: indexPath, item: aItem)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard headerSectionHeight > 0 else {
            return nil
        }
        
        if let sectionView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerSectionType.sectionViewName){
            if let aSectionView = sectionView as? TCZSectionTitleView {
                aSectionView.title = "I am a header sectionView title, i am so easy to create";
            }
            tczHeaderSectionView(sectionView: sectionView)
            
            return sectionView
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerSectionHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard footerSectionHeight > 0 else {
            return nil
        }
        
        if let sectionView = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerSectionType.sectionViewName){
            if let aSectionView = sectionView as? TCZSectionTitleView {
                aSectionView.title = "I am a footer sectionView title, i am so easy to create";
            }
            tczFooterSectionView(sectionView: sectionView)
            
            return sectionView
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return footerSectionHeight
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return isOpendDelete
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        guard isOpendDelete else {
            return .none
        }
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard isOpendDelete else {
            return
        }
        
        if editingStyle == .delete{
            tczDidDelete(atIndexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataAtIndexPath(indexPath: indexPath).cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        tczDidSelect(atIndexPath: indexPath)
    }
    
    //MARK: - SubClass can implementation
    func tczCellReuse(cell: TCZBaseTableCell, atIndexPath: IndexPath, item: TCZTableViewData) {}
    
    func tczHeaderSectionView(sectionView: UIView) {}
    
    func tczFooterSectionView(sectionView: UIView) {}
    
    func tczDidDelete(atIndexPath indexPath: IndexPath) {}
    
    func tczDidSelect(atIndexPath indexPath: IndexPath) {}
    
    func tczDeleteLocalData(atIndexPath indexPath: IndexPath, animation: UITableViewRowAnimation) {
        if isGroup {
            guard indexPath.section < groupDataArray.count else {
                return
            }
            
            guard indexPath.row < groupDataArray[indexPath.section].count else {
                return
            }
            
            var sectionDatas = groupDataArray[indexPath.section]
            sectionDatas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: animation)
        }
        else{
            guard indexPath.row < dataArray.count else {
                return
            }
            dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: animation)
        }
    }
    
    // MARK: - Helper
    func dataAtIndexPath(indexPath: IndexPath) -> TCZTableViewData {
        let aItem: TCZTableViewData!
        if isGroup {
            aItem = groupDataArray[indexPath.section][indexPath.row]
        }else{
            aItem = dataArray[indexPath.row]
        }
        return aItem
    }
}
