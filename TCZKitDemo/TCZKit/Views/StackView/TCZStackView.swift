//
//  TCZStackView.swift
//  Dormouse
//
//  Created by tczy on 2017/8/14.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit

enum TCZStackItemType {
    
    //纯文字
    case Title
    //纯图片
    case Image
    //左边文字，右边图片
    case LeftTitleRightImage
    //左边图片，右边文字
    case LeftImageRightTitle
    //上边图片，下边文字
    case TopImageBottomTitle
}

struct TCZStackItem {
    
    var itemTitle: NSString?
    
    var itemColorNormal: UIColor?
    var itemColorHighLighted: UIColor?
    var itemColorSelected: UIColor?
    
    var itemImageNormal: UIImage?
    var itemImageHighLighted: UIImage?
    var itemImageSelected: UIImage?
    
    /// The item type
    var itemType: TCZStackItemType
    
    init(type: TCZStackItemType) {
        self.itemType = type
    }
}


class TCZStackView: UIView {
    
    var stackItems: NSArray = []
    var stackViewButtonClickBlock: ((_ index: Int) -> ())?


    //MARK: - LifeCycle
    convenience init(frame: CGRect, items: NSArray) {
        self.init(frame: frame)
        
        stackItems = items
        self.backgroundColor = UIColor.black
        self.createStackSubviews()
    }
    
    //MARK: - Click Action
    func stackViewButtonClickAction(button: UIButton) {
        
        if stackViewButtonClickBlock != nil {
            stackViewButtonClickBlock!(button.tag)
        }
    }

    //MARK: - Methond
    func setIsSelectedAtIndex(index: Int, isSelected: Bool) {
        
        if index > stackItems.count {
            return
        }
        let stackCollectionCell: TCZStackCollectionCell = collectionView.cellForItem(at: IndexPath.init(row: index, section: 0)) as! TCZStackCollectionCell
        stackCollectionCell.button.isSelected = isSelected
    }
    
    func setIsEnabledAtIndex(index: Int, isEnabled: Bool) {
        
        if index > stackItems.count {
            return
        }
        let stackCollectionCell: TCZStackCollectionCell = collectionView.cellForItem(at: IndexPath.init(row: index, section: 0)) as! TCZStackCollectionCell
        stackCollectionCell.button.isEnabled = isEnabled
    }
    
    func setTitleAtIndex(index: Int, title: NSString) {
        
        if index > stackItems.count {
            return
        }
        let item: TCZStackItem = stackItems[index] as! TCZStackItem
        if item.itemType == .Image {
            return
        }
        
        let stackCollectionCell: TCZStackCollectionCell = collectionView.cellForItem(at: IndexPath.init(row: index, section: 0)) as! TCZStackCollectionCell
        stackCollectionCell.button.setTitle(title as String, for: .normal)
        
        if (item.itemType == .LeftImageRightTitle) {
            stackCollectionCell.button.ajustImagePosition(position: .left, offset: 5)
        }else if (item.itemType == .LeftTitleRightImage) {
            stackCollectionCell.button.ajustImagePosition(position: .right, offset: 5)
        }else if (item.itemType == .TopImageBottomTitle) {
            stackCollectionCell.button.ajustImagePosition(position: .top, offset: 5)
        }
    }
    
    //MARK: - CreateUI
    func createStackSubviews() {
        
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let aCollection = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        aCollection.backgroundColor = UIColor.clear
        aCollection.delegate = self
        aCollection.dataSource = self
        aCollection.isScrollEnabled = false
        aCollection.showsHorizontalScrollIndicator = false
        aCollection.register(TCZStackCollectionCell.self, forCellWithReuseIdentifier: NSStringFromClass(TCZStackCollectionCell.self))

        return aCollection
    }()
    
}

extension TCZStackView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stackItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(TCZStackCollectionCell.self), for: indexPath) as! TCZStackCollectionCell
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(stackViewButtonClickAction(button:)), for: .touchUpInside)
        cell.loadStackCollectionCellData(item: stackItems[indexPath.row] as! TCZStackItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = self.bounds.width / CGFloat(stackItems.count)
        return CGSize(width:width, height:self.bounds.height)
    }
    
}


class TCZStackCollectionCell: UICollectionViewCell {
    
    //MARK: - LifeCycle
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        
        contentView.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(5, 5, 5, 5))
        }
    }
    
    //MARK: - Data
    func loadStackCollectionCellData(item: TCZStackItem) {
        
        button.setTitle(item.itemTitle as String?, for: .normal)
        button.setTitleColor(item.itemColorNormal, for: .normal)
        button.setTitleColor(item.itemColorHighLighted, for: .highlighted)
        button.setTitleColor(item.itemColorSelected, for: .selected)
        
        button.setImage(item.itemImageNormal, for: .normal)
        button.setImage(item.itemImageHighLighted, for: .highlighted)
        button.setImage(item.itemImageSelected, for: .selected)
        
        switch item.itemType {
        case .Title:
            
            button.imageEdgeInsets = UIEdgeInsets.zero
            button.titleEdgeInsets = UIEdgeInsets.zero
            break
        case .Image:
            
            button.imageEdgeInsets = UIEdgeInsets.zero
            button.titleEdgeInsets = UIEdgeInsets.zero
            break
        case .LeftTitleRightImage:
            
            button.ajustImagePosition(position: .right, offset: 5)
            break
        case .LeftImageRightTitle:
            
            button.ajustImagePosition(position: .left, offset: 5)
            break
        case .TopImageBottomTitle:
            
            button.ajustImagePosition(position: .top, offset: 5)
            break
        }
    }
    
    //MARK: - create
    lazy var button: UIButton = {
        
        let button: UIButton = UIButton.tczButton()
        button.backgroundColor = UIColor.clear
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.tcz_systemFontWithSize(size: 13.0)
        return button
    }()
    
}
