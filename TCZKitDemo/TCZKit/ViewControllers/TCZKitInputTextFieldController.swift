//
//  TCZKitInputTextFieldController.swift
//  Dormouse
//
//  Created by 田向阳 on 2017/8/11.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit

class TCZKitInputTextFieldController: TCZBaseViewController,UITextFieldDelegate {
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
        registNotification()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: LoadData
    private func loadData() {
        self.textField.text = self.content
        self.textField.placeholder = self.placeHolder
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
            confirmBlock!(self.textField.text!)
        }
        self.navigationController?.popViewController(animated: true)
    }

    func textDidChanged() {
        if (textField.text?.length)! > limitCount {
            if textField.markedTextRange != nil {
                return
            }
            textField.text = textField.text?.toNSString.substring(to: limitCount)
        }
        updateRightItemEnable()
    }
    
    private func updateRightItemEnable() {
       
        self.navigationItem.rightBarButtonItem?.isEnabled = (self.textField.text?.length)! > 0
    }
    //MARK: UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else{
            return true
        }
      
        if string == "" {
            return true
        }
        
        if textField.markedTextRange != nil {
            return true
        }
        let textLength = text.length + string.length - range.length
        if textLength > limitCount {
            textField.text = (text + string).toNSString.substring(to: limitCount)
        }
        return textLength <= limitCount
    }
    
    //MARK: AddNotificatoin
    private func registNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChanged), name: .UITextFieldTextDidChange, object: nil)
    }
    
    //MARK: CreateUI
    private func createUI() {
        view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        view.addSubview(tipLabel)
        tipLabel.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom)
            make.left.equalTo(10)
            make.height.equalTo(40)
            make.right.equalTo(-kLeftEdge)
        }
    }
    
    lazy var textField: UITextField = {
    let textField = UITextField()
        textField.placeholder = "请输入内容"
        textField.font = UIFont.tcz_systemFontWithSize(size: kTitleFontSize)
        textField.textColor = .gray
        textField.delegate = self
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var tipLabel: UILabel = {
    let label = UILabel.tczLabel(text: nil, font: UIFont.tcz_systemFontWithSize(size: 13), color: UIColor.gray)
        return label
    }()
    //MARK: Helper
}

