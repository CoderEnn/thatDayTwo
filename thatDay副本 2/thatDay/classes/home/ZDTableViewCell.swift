//
//  ZDTableViewCell.swift
//  thatDay
//
//  Created by zz on 16/4/25.
//  Copyright © 2016年 me. All rights reserved.
//

import UIKit

class ZDTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor.purpleColor()

    }


    
    // MARK: - 属性
    var eventModel: ZDEventModel?{
        didSet{
            eventLabel.text = eventModel!.event
            lastingLabel.text = eventModel!.lasting
            reminLabel.text = eventModel!.remind
        }
    }

    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var lastingLabel: UILabel!
    @IBOutlet weak var reminLabel: UILabel!
    
}


