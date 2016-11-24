//
//  UIImageView+TCZ.swift
//  TCZGenerateUIDemo
//
//  Created by WangSuyan on 2016/11/21.
//  Copyright © 2016年 WangSuyan. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    class func tczImageView(image: UIImage?) -> UIImageView {
        let view = UIImageView()
        view.contentMode = .center
        if let aImage = image {
            view.image = aImage
        }
        return view
    }
    
    class func tczImageView() -> UIImageView {
        return tczImageView(image: nil)
    }
}
