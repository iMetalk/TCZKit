//
//  TCZBaseNavigationController.swift
//  Dormouse
//
//  Created by tczy on 2017/8/14.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit

class TCZBaseNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.interactivePopGestureRecognizer?.delegate = self
        
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.setBackgroundImage(UIImage(named: ""), for: .default)
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.tcz_boldSystemFontWithSize(size: 18)]
        
        self.navigationBar.shadowImage = UIImage()
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let isTra = self.value(forKey: "_isTransitioning") as? Bool {
            return self.viewControllers.count != 1 && !isTra
        }
        return false
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

}
