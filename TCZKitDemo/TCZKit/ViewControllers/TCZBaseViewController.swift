//
//  TCZBaseViewController.swift
//  Dormouse
//
//  Created by tczy on 2017/8/14.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import AVFoundation
import PKHUD

class TCZBaseViewController: UIViewController {
    
    var isCloseShake: Bool = false

    //MARK: - Life Cycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        print("Init: ", self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    deinit {
        print("Dealloc: ", self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.navigationController != nil {
            if (self.navigationController?.viewControllers.count)! > 1 {
                self.setLeftBackImage()
            }
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    //MARK: - Methond
    /// 设置导航左边按钮为 ×
    func setLeftCloseImage() {
        self.setLeftButtonItemWithImage(image: UIImage(named: "navi_close")!)
    }
    
    /// 设置导航左边按钮为 →
    func setLeftBackImage() {
        self.setLeftButtonItemWithImage(image: UIImage(named: "navi_back")!)
    }
    
    /// 导航左按钮点击事件（子类需要就重写）
    func didClickNavigationBarBackButton() {
        popOrDismissCurrentViewControllerAnimate(isAnimate: true)
    }
    
    /// 导航右按钮点击事件（子类需要就重写）
    func didClickNavigationBarRightButton() {
        
    }
    
    /// 设置导航左按钮的标题
    ///
    /// - Parameter title: 标题
    public func setLeftButtonItemWithTitle(title: NSString) {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: title as String, style: .plain, target: self, action: #selector(didClickNavigationBarBackButton))
    }
    
    /// 设置导航左按钮的图片
    ///
    /// - Parameter image: 图片
    public func setLeftButtonItemWithImage(image: UIImage) {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: image, style: .plain, target: self, action: #selector(didClickNavigationBarBackButton))
    }
    
    /// 设置导航右按钮的标题
    ///
    /// - Parameter title: 标题
    public func setRightButtonItemWithTitle(title: NSString) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: title as String, style: .plain, target: self, action: #selector(didClickNavigationBarRightButton))
    }
    
    /// 设置导航右按钮的图片
    ///
    /// - Parameter image: 图片
    public func setRightButtonItemWithImage(image: UIImage) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: image, style: .plain, target: self, action: #selector(didClickNavigationBarRightButton))
    }
    
    /// pop 或者 dismiss出当前的controller
    ///
    /// - Parameter isAnimate: 是否动画
    func popOrDismissCurrentViewControllerAnimate(isAnimate: Bool) {
        if let navVC = self.navigationController {
            let vcs = navVC.viewControllers
            if vcs.count > 1 {
                if vcs[vcs.count-1] == self {
                    navVC.popViewController(animated: isAnimate)
                } else {
                    navVC.dismiss(animated: isAnimate, completion: nil)
                }
            }
        }
    }

}


//MARK: - 发生错误时,从顶部弹出错误提示,3秒之后消失
extension TCZBaseViewController {
    
    // MARK: - motion
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        let path:String? = Bundle.main.path(forResource: "shake", ofType: "mp3")
        
        if path != nil {
            var soundID:SystemSoundID?
            AudioServicesCreateSystemSoundID(URL.init(fileURLWithPath: path!) as CFURL,&soundID!)
            //播放声音
            AudioServicesPlaySystemSound(soundID!)
        }
        print("开始抖动")
    }
    
    override func motionCancelled(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        print("取消抖动")
        HUD.flash(.label("不给力啊"), delay: 2.0) { _ in
            
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if isCloseShake { return }
        if motion == UIEventSubtype.motionShake {
            print("结束抖动")
//            let popVC = TCZLogPopViewController()
//            
//            popVC.afterDismissAction = { [weak self] in
//                
//                self?.view.window?.makeKeyAndVisible()
//            }
//            
//            popWindow.rootViewController = popVC
//            popWindow.windowLevel = UIWindowLevelAlert - 1
//            popWindow.makeKeyAndVisible()
        }
        
    }
    
    func showErrorFromTop(errorDes: String) -> Void {
        let tipLable = UILabel.tczLabel(text: errorDes, font: nil, color: nil)
        tipLable.frame = CGRect(x: 0, y: -40, width: WINDOW_WIDTH, height: 40)
        self.view.addSubview(tipLable)
        tipLable.backgroundColor = .red
        tipLable.textColor = .white
        tipLable.textAlignment = .center
        UIView.animate(withDuration: 0.25, animations: {
            tipLable.TCZ_y = 0;
        }) { (isFinish) in
            if isFinish {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                    UIView.animate(withDuration: 0.25, animations: {
                        tipLable.TCZ_y = -40
                    }, completion: { (isFinish) in
                        if isFinish {
                            tipLable.removeFromSuperview()
                        }
                    })
                })
            }
        }
    }
}

