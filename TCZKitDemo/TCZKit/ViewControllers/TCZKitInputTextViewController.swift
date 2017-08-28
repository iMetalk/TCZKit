//
//  TCZKitInputTextViewController.swift
//  Dormouse
//
//  Created by 田向阳 on 2017/8/14.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class TCZKitInputTextViewController: TCZBaseViewController,UITextViewDelegate {
    //MARK:Property
    open var placeHolder: String?
    open var limitCount: Int = 0
    open var content: String?
    open var tipString: String?
    open var confirmBlock:((_ text: String)->())?

    //MARK: ControllerLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initControllerFirstData()
        createUI()
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textView.becomeFirstResponder()
    }
    //MARK: LoadData
    private func loadData() {
        self.textView.text = self.content
        self.textView.placeholder = self.placeHolder
        self.tipLabel.text = self.tipString
        textDidChanged()
    }
    
    private func initControllerFirstData() {
        self.title = String(describing: self)
        view.backgroundColor = UIColor.HexColor(hexValue: 0xf2f2f2)
        self.setRightButtonItemWithTitle(title: "确定")
    }

    //MARK: Action
    override func didClickNavigationBarRightButton() {
        if confirmBlock != nil {
            confirmBlock!(self.textView.text!)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textDidChanged()
    }
    
    func textDidChanged() {
        if (textView.text?.length)! > limitCount {
            if textView.markedTextRange != nil {
                return
            }
            textView.text = textView.text?.toNSString.substring(to: limitCount)
        }
        updateRightItemEnable()
    }
    
    private func updateRightItemEnable() {
        
        self.navigationItem.rightBarButtonItem?.isEnabled = (self.textView.text?.length)! > 0
    }

    //MARK: CreateUI
    private func createUI() {
        view.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        view.addSubview(tipLabel)
        tipLabel.snp.makeConstraints { (make) in
            make.top.equalTo(textView.snp.bottom)
            make.left.equalTo(10)
            make.height.equalTo(40)
            make.right.equalTo(-kLeftEdge)
        }
    }
    
    lazy var textView: IQTextView = {
        let textView = IQTextView()
        textView.placeholder = "请输入内容"
        textView.font = UIFont.tcz_systemFontWithSize(size: kTitleFontSize)
        textView.textColor = .gray
        textView.delegate = self
        textView.backgroundColor = .white
        return textView
    }()
    
    lazy var tipLabel: UILabel = {
        let label = UILabel.tczLabel(text: nil, font: UIFont.tcz_systemFontWithSize(size: 13), color: UIColor.gray)
        return label
    }()
    //MARK: Helper
}
