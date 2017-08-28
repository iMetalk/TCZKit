//
//  TCZActionButton.swift
//  Dormouse
//
//  Created by liuyunxin on 2017/8/15.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit

class TCZActionButton: UIButton {

    /// loading的时候是否显示title
    ///
    /// - none: 不显示
    /// - show: 显示
    enum TCZActionButtonLoadingShowTitleType {
        case none
        case show
    }
    
   private var isStartLoading: Bool = false
    
    //默认不显示title
   private var titleShowType: TCZActionButtonLoadingShowTitleType = .none
    
    //titleStr
   private var titleStr = ""
    
    
    lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(activityIndicatorStyle: .white)
        view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        return view
    }()
    
    convenience init(title: String?, image: String?, hlImage: String?,bgImage: String?, fontSize: CGFloat, titleColor: UIColor?, loadingIsShowTitle: TCZActionButtonLoadingShowTitleType?) {
        self.init()
        self.setImage(UIImage(named: image ?? ""), for: .normal)
        self.setImage(UIImage(named: hlImage ?? ""), for: .highlighted)
        self.setBackgroundImage(UIImage(named: bgImage ?? ""), for: .normal)
        self.setTitle(title ?? "", for: .normal)
        self.setTitleColor(titleColor ?? UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.sizeToFit()
        self.addSubview(self.indicatorView)
        self.titleShowType = loadingIsShowTitle ?? .none
        self.titleStr = title ?? ""
    }
    
    override func layoutSubviews() {
        if !isStartLoading  {
            
            switch self.titleShowType {
            case .none:
                self.indicatorView.frame = CGRect(x: (self.TCZ_width - self.indicatorView.TCZ_width) / 2, y: (self.TCZ_height - self.indicatorView.TCZ_height) / 2.0, width: 25, height: 25)
                self.titleLabel?.frame = self.bounds
                break
            case .show:
                self.indicatorView.frame = CGRect(x: 0, y: (self.TCZ_height - self.indicatorView.TCZ_height) / 2.0, width: 25, height: 25)
                self.titleLabel?.frame = CGRect(x: (self.TCZ_width - (self.titleLabel?.TCZ_width)! ) / 2, y: (self.TCZ_height - (self.titleLabel?.TCZ_height)! ) / 2, width: self.titleLabel?.TCZ_width ?? 0, height: self.titleLabel?.TCZ_height ?? 0)
                break
            }
        }
    }
    
    func startLoading() -> Void {
        self.adjustTitlePosition(offset: 40)
        self.isUserInteractionEnabled = false
        self.indicatorView.startAnimating()
    }
    
    func stopLoading() -> Void {
        self.resumeTitlePosition()
        self.isUserInteractionEnabled = true
        self.indicatorView.stopAnimating()
    }
    
    private func adjustTitlePosition(offset: CGFloat) -> Void {
        self.isStartLoading = true
        switch self.titleShowType {
        case .none:
            self.setTitle("", for: .normal)
            self.titleLabel?.sizeToFit()
            break
        case .show:
            let allWidth = offset + self.indicatorView.TCZ_width + (self.titleLabel?.TCZ_width)!
            self.indicatorView.TCZ_x = (self.TCZ_width - allWidth) / 2
            self.titleLabel?.TCZ_left = self.indicatorView.TCZ_right + offset
            break
        }
    }
    
    private func resumeTitlePosition() -> Void {
        self.isStartLoading = false
        switch self.titleShowType {
        case .none:
            self.setTitle(self.titleStr, for: .normal)
            self.titleLabel?.sizeToFit()
            break
        case .show:
            self.titleLabel?.TCZ_x = (self.TCZ_width - (self.titleLabel?.TCZ_width)!) / 2
            self.indicatorView.TCZ_x = 0
            break
        }
    }

}
