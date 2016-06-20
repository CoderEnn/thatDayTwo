//
//  UITextField+Extension.swift
//  thatDay
//
//  Created by dongmei zeng on 16/6/12.
//  Copyright © 2016年 me. All rights reserved.
//

import Foundation

extension UITextField {

    convenience init(placeholder: String){
        self.init()
        self.placeholder = placeholder
        self.clearButtonMode = .Always
    }
}