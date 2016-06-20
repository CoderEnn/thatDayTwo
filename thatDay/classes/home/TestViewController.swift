//
//  TestViewController.swift
//  thatDay
//
//  Created by zz on 16/4/28.
//  Copyright © 2016年 me. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.yellowColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
