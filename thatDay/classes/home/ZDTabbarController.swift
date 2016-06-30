//
//  ZDTabbarController.swift
//  thatDay
//
//  Created by zz on 16/4/25.
//  Copyright © 2016年 me. All rights reserved.
//

import UIKit

class ZDTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ZDTabbarController {

    func setupUI() {
    

        view.backgroundColor = UIColor.whiteColor()
        
        let story: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        addchildController(story.instantiateInitialViewController()!, title: "home")
        
        addchildController(ProfileViewController(), title: "profile")
        
        addchildController(ZDLoginViewController(), title: "login")

    }
    
    func addchildController(vc: UIViewController, title: String) {
    
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFontOfSize(20)], forState: .Normal)
        vc.title = title
        addChildViewController(vc)

        
    }
}
