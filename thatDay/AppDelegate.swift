//
//  AppDelegate.swift
//  thatDay
//
//  Created by zz on 16/4/25.
//  Copyright © 2016年 me. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
       
        self.appKey()
       
        ZDNetworking.sharedTool.reachabilityManager.startMonitoring()

        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        let tabbar: ZDTabbarController = ZDTabbarController()
//        self.window!.rootViewController = tabbar
//        tabbar.view.backgroundColor = UIColor.grayColor()
        !UserAccount.sharedUserAccount.isLogin ? login() : tabbar()
        self.window!.makeKeyAndVisible()
        return true

    }
    ///第三方
    func appKey() {
        UMSocialData.setAppKey("5729f8c467e58e1875000e43")
        
        UMSocialWechatHandler.setWXAppId("wx99d71774a3736802", appSecret: "5df6d42e5ed0a7c7bc2948f19e26d653", url:"http://www.umeng.com/social")
        UMSocialSinaSSOHandler.openNewSinaSSOWithAppKey("3486182173", secret: "6cf9bb1839cc7b152dff6f4949ae844f", redirectURL: "http://www.baidu.com")
        
        AVOSCloud.setApplicationId("nJYsEi0PPkzV4L8cf7FgleKO-gzGzoHsz", clientKey: "s7Q1EkPTcNA4GEWILqoAK8DM")
    }
    func login(){
        let login: ZDLoginViewController = ZDLoginViewController()
        self.window?.rootViewController = login
    }
    func tabbar() {
        let tabbar: ZDTabbarController = ZDTabbarController()
        self.window!.rootViewController = tabbar
//        tabbar.view.backgroundColor = UIColor.grayColor()
    }
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {

        let isYes = app.canOpenURL(url)
        
        print("isYes = \(isYes)")
        let result: Bool = UMSocialSnsService.handleOpenURL(url)
        if result == true {
     
            NSFontAttributeName

            print("open")
        }else {
        
            print("false")
        }
        return result
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

