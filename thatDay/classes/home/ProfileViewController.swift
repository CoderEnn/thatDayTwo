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
        title = "第三方登录"
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(webView)
        
        webView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
        navigationItem.leftBarButtonItem = cancleBarButton
        webView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private  var webView: UIWebView = {
        let webView = UIWebView()
        let str = "https://api.weibo.com/oauth2/authorize?client_id=3486182173&redirect_uri=http://www.baidu.com"
        let url = NSURL(string: str)
        webView.loadRequest(NSURLRequest(URL: url!))
//        webView.delegate = self
        return webView
    }()
    
    private lazy var cancleBarButton: UIBarButtonItem = {
        let cancleBarButton = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: #selector(UMSocialIconActionSheet.dismiss))
        return cancleBarButton
    }()
    // MARK: - target
    @objc private func dismiss(){
        SVProgressHUD.dismiss()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    deinit {
        print("xiao")
    }

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
            print("的")
            guard let result = result else {
                print("您的网络不给力")
                return
            }
            UserAccount.sharedUserAccount.updateUserAccount(result)
//            SVProgressHUD.showImage(UIImage(named: "red"), status: "denglu")
            SVProgressHUD.showWithStatus("登录成功")
            //这句代码又问题
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(Double(NSEC_PER_SEC) * 5)), dispatch_get_main_queue()) {
                SVProgressHUD.dismiss()
                self.dismissViewControllerAnimated(true, completion: nil)
                UIApplication.sharedApplication().keyWindow?.rootViewController = ZDTabbarController()
//            }
            
        }
    return false
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
}
