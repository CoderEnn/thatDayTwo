//
//  UILabel+Extension.swift
//  thatDay
//
//  Created by dongmei zeng on 16/6/12.
//  Copyright © 2016年 me. All rights reserved.
//

import Foundation

extension UILabel {
    
    convenience init(text: String,
                     color: UIColor = UIColor.blackColor(),
                     font: UIFont = UIFont.systemFontOfSize(14),
                     alignment: NSTextAlignment = .Center){
        self.init()
        self.text = text
        self.textColor = color
        self.font = font
        self.textAlignment = alignment
        sizeToFit()
        self.numberOfLines = 0
    }
}