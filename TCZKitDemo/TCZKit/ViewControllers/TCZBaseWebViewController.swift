//
//  TCZBaseWebViewController.swift
//  Dormouse
//
//  Created by tczy on 2017/8/14.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import UIKit
import WebKit

class TCZBaseWebViewController: TCZBaseViewController {

    //MARK: - ViewController LifeCycle
    deinit {
        
        webView.removeObserver(self, forKeyPath: "canGoBack")
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initControllerFirstData()
        createUI()
        loadData()
    }
    
    //MARK: - Property
    open var url: String?
    private var backItem: UIBarButtonItem?
    private var closeItem: UIBarButtonItem?
    
    lazy var webView: WKWebView = {
        
        let web = WKWebView()
        web.addObserver(self, forKeyPath: "canGoBack", options: .new, context: nil)
        web.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        return web
    }()
    
    lazy var progressView :UIProgressView = {
        
        let progress = UIProgressView()
        return progress
    }()
    
    
    //MARK: - LoadData
    func loadData() {
        
        if url == nil {
            return
        }
        if !(url?.hasPrefix("http://"))! && !(url?.hasPrefix("https://"))! {
            url = "http://".appending(url!)
        }
        let request = URLRequest(url: URL(string: url!)!)
        self.webView.load(request)
    }
    
    func initControllerFirstData() {
        
        view.backgroundColor = .white
        self.backItem = UIBarButtonItem(title: "<返回", style: .plain, target: self, action: #selector(goBack))
        self.closeItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(closeClick))
        self.navigationItem.leftBarButtonItems = [backItem!]
    }
    
    //MARK: - Action
    func goBack() {
        
        if self.webView.canGoBack {
            self.webView.goBack()
        }else{
            closeClick()
        }
    }
    
    func closeClick() {
        
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateLeftNavigationItem(canGoback: Bool) {
        
        if canGoback {
            self.navigationItem.leftBarButtonItems = [backItem!, closeItem!]
        }else{
            self.navigationItem.leftBarButtonItems = [backItem!]
        }
    }
    
    //MARK: - KVO
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "canGoBack" {
            updateLeftNavigationItem(canGoback: self.webView.canGoBack)
        }else if keyPath == "estimatedProgress" {
            self.progressView.isHidden = self.webView.estimatedProgress >= 1
            self.progressView.progress = Float(self.webView.estimatedProgress);
        }else{
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    //MARK: - CreateUI
    func createUI() {
        
        self.view.addSubview(self.webView)
        self.webView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 20)
        view.addSubview(progressView)
        progressView.frame = CGRect(x: 0, y: 0, width: self.webView.frame.size.width, height: 4)
    }
    
}
