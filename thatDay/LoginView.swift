//
//  LoginView.swift
//  thatDay
//
//  Created by dongmei zeng on 16/6/18.
//  Copyright © 2016年 me. All rights reserved.
//

import UIKit

class LoginView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var loginBtn: UIButton = {
        let loginBtn = UIButton(type: .Custom)
        loginBtn.backgroundColor = UIColor.yellowColor()
        loginBtn.titleLabel?.numberOfLines = 3
        let lineH = loginBtn.titleLabel?.font.lineHeight
        var attr: NSMutableAttributedString = NSMutableAttributedString(string: "string1")
        let textA: NSTextAttachment = NSTextAttachment()
        textA.bounds = CGRectMake(20, -20, lineH!, lineH!)
        textA.image = UIImage(named: "weibo")
        let str = "data"
        
        let data: NSData = NSData(base64EncodedString: str, options: .IgnoreUnknownCharacters)!
        textA.contents = data
        textA.fileType = "text"
        var attr1 = NSAttributedString(attachment: textA)
        attr.appendAttributedString(attr1)
        loginBtn.setAttributedTitle(attr, forState: .Normal)
        
        loginBtn.center = self.center
        loginBtn.bounds = CGRectMake(0, 0, 200, 200)
        return loginBtn
    }()
}
extension LoginView {
    func setupUI(){
        backgroundColor = UIColor.whiteColor()
        addSubview(loginBtn)


    }
}
