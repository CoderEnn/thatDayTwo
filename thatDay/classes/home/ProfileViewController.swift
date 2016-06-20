//
//  ProfileViewController.swift
//  thatDay
//
//  Created by zz on 16/4/25.
//  Copyright © 2016年 me. All rights reserved.
//

import UIKit
import SVProgressHUD

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)
        
        webView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private lazy var webView: UIWebView = {
        let webView = UIWebView()
        let str = "https://api.weibo.com/oauth2/authorize?client_id=3486182173&redirect_uri=http://www.baidu.com"
        let url = NSURL(string: str)
        webView.loadRequest(NSURLRequest(URL: url!))
        webView.delegate = self
        return webView
    }()
}

extension ProfileViewController: UIWebViewDelegate {
     func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        SVProgressHUD.show()
        print(request.URL)
        // 1. 如果 URL 不是 回调地址，就继续加载页面
        if let urlString = request.URL?.absoluteString
          where !urlString.hasPrefix(ZDNetworking.sharedTool.redirect_uri) {
            return true
        }
        // 2. 判断回调参数，如果授权成功 URL 的`查询字符串`中包含 code 参数
        guard let query = request.URL?.query where query.hasPrefix("code") else {
            print("取消授权")
            return false
        }
        print("请求字符串 " + query)
        
        // 3 加载token 
        // 2> 获得请求码
        let code = query.substringFromIndex("code=".endIndex)
        print("请求码 = \(code)")
        ZDNetworking.sharedTool.loadAccessToken(code) { (result) -> () in
            guard let result = result else {
                print("您的网络不给力")
                return
            }
            userAccount.sharedUserAccount.updateUserAccount(result)
        }
    return true
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
}
