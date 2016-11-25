//
//  UIButton+TCZ.swift
//  TCZKitDemo
//
//  Created by WangSuyan on 2016/11/25.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import UIKit

extension UIButton {
    
    class func tczButton(title: String?, image: UIImage?, heImage:UIImage?, bgImage: UIImage?) -> UIButton {
        
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setImage(image, for: .normal)
        button.setImage(heImage, for: .highlighted)
        button.setBackgroundImage(bgImage, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        
        return button
    }
    
    class func tczButton(bgImage: UIImage?) -> UIButton {
        return tczButton(title: nil, image: nil, heImage: nil, bgImage: bgImage)
    }
}
