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
    private lazy var titleLabel: UILabel = UILabel(text: "thatDay")
    private lazy var phoneField: UITextField = UITextField(placeholder: "请输入你的手机号")
    private lazy var verifyCodeField: UITextField = UITextField(placeholder: "请输入验证码")
}
// MARK: - setupUI
extension ZDLoginViewController {
    func setupUI() {
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(titleLabel)
        view.addSubview(phoneField)
        view.addSubview(verifyCodeField)
        
        titleLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view.snp_top).offset(30)
        }
        phoneField.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(titleLabel.snp_bottom).offset(100)
        }
//        verifyCodeField.snp_makeConstraints { (make) in
//            make.centerX.equalTo(self.view)
//            make.centerY.equalTo(<#T##other: CGFloat##CGFloat#>)
//        }
        
        
    }
}
