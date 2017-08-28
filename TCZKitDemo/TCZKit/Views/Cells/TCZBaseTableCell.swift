//
//  TCZBaseTableCell.swift
//  Dormouse
//
//  Created by tczy on 2017/8/11.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit

class TCZBaseTableCell: UITableViewCell {

    // MARK: - init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        tczCreateUI()
        tczCreateBaseCellUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    //MARK: - data
    func tczConfigureData(aItem: TCZTableViewData) {
        
    }
    
    func tczCreateBaseCellUI() {
        
    }
    
    
    //MARK: - set methond
    //默认显示line
    public func setIsHiddenLine(isHiddenLine: Bool) {
        
        lineImgView.isHidden = isHiddenLine
    }
    
    //默认不显示arrow
    public func setIsHiddenArrow(isHiddenArrow: Bool) {
        
        self.accessoryView = isHiddenArrow ? nil : arrowImgView
    }
    
    public func setSelectedBgColor(selectedBgColor: UIColor) {
        
        selectedBgView.backgroundColor = selectedBgColor
        self.selectedBackgroundView = selectedBgView
    }
    
    public func setLineImage(lineImage: UIImage) {
        
        lineImgView.image = lineImage
    }
    
    public func setArrowImage(arrowImage: UIImage) {
        
        arrowImgView.image = arrowImage
        arrowImgView.frame = CGRect(x:0, y:0, width:arrowImage.size.width, height:arrowImage.size.height)
        self.accessoryView = arrowImgView
    }
    
    
    // MARK: - createUI
    private func tczCreateUI() {
        
        self.selectedBackgroundView = selectedBgView
        
        self.contentView.addSubview(lineImgView)
        lineImgView.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    
    private lazy var selectedBgView: UIView = {
        
        let view = UIView.init(frame: self.frame)
        view.backgroundColor = UIColor.HexColor(hexValue: 0xf7f7f7)
        return view
    }()
    
    private lazy var lineImgView: UIImageView = {
        
        let line = UIImageView.tczImageView(image: UIImage(named: "line.png"))
        return line
    }()
    
    private lazy var arrowImgView: UIImageView = {
        
        let arrow = UIImageView.tczImageView(image: UIImage(named: "arrow.png"))
        arrow.contentMode = .scaleAspectFit
        arrow.frame = CGRect(x:0, y:0, width:17/2, height:30/2)
        return arrow
    }()

}
