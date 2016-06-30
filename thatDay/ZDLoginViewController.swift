//
//  ZDLoginViewController.swift
//  thatDay
//
//  Created by dongmei zeng on 16/6/12.
//  Copyright © 2016年 me. All rights reserved.
//

import UIKit
import SnapKit

class ZDLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - 私有属性
    lazy var loginBtn: UIButton = {
        let loginBtn = UIButton(type: .Custom)
        loginBtn.backgroundColor = UIColor.yellowColor()
        loginBtn.titleLabel?.numberOfLines = 3
        loginBtn.titleLabel?.textAlignment = .Center
        let lineH = loginBtn.titleLabel?.font.lineHeight
        var attr: NSMutableAttributedString = NSMutableAttributedString(string: "使用微博登录\n")
        let textA: NSTextAttachment = NSTextAttachment()
        //textA.bounds = CGRectMake(20, -20, lineH!, lineH!)
        textA.image = UIImage(named: "weibo")

        var attr1 = NSAttributedString(attachment: textA)
        attr.appendAttributedString(attr1)
        loginBtn.setAttributedTitle(attr, forState: .Normal)
        
        loginBtn.sizeToFit()
        loginBtn.center = self.view.center
        //        loginBtn.bounds = CGRectMake(0, 0, 200, 200)
        loginBtn.addTarget(self, action: #selector(ZDLoginViewController.login), forControlEvents: .TouchUpInside)
        return loginBtn
    }()
    
    // MARK: - target
    @objc private func login(){
        let nav: UINavigationController = UINavigationController(rootViewController: ProfileViewController())
        self.presentViewController(nav, animated: true, completion: nil)
    }


}
// MARK: - setupUI
extension ZDLoginViewController {
    func setupUI(){
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(loginBtn)
    }
}
