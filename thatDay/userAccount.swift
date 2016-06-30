//
//  userAccount.swift
//  thatDay
//
//  Created by dongmei zeng on 16/6/18.
//  Copyright © 2016年 me. All rights reserved.
//

import UIKit
/*
 ["access_token": 2.00qqCjZDjOfvnD17705d45ccbNHCpC, "remind_in": 157679999, "uid": 3276305980, "expires_in": 157679999]
 */
/// 用户账户 key
private let ZDWeiBoUserAccountKey = "ZDWeiBoUserAccount"
private let ZDAVClassNamekey = "ZDAVClassName"
var ZDAVClassName: String?
class UserAccount: NSObject {
    /// 用户账户单例，全局入口
    static let sharedUserAccount = UserAccount()
    
    var access_token: String?
    var remind_in: String?
    var uid: String?
    var expires_in: NSTimeInterval = 0 {
        didSet {
            expiresDate = NSDate(timeIntervalSinceNow: expires_in)
        }
    }
    var expiresDate: NSDate?
    //判断是否登录
    var isLogin: Bool {
        return access_token != nil
    }
    //判断token是否过期
    private var isExpired: Bool{
        return expiresDate?.compare(NSDate()) == NSComparisonResult.OrderedAscending
    }
    private override init() {
        super.init()
        //在使用到账户信息的时候，就可以立马对token进行判断
        loadUserAccount()
    }
}
extension UserAccount {
    
    func updateUserAccount(dict: [String: AnyObject]){
        setValuesForKeysWithDictionary(dict)
        saveUserAccount()
    }
    
    //保存账号信息
    func saveUserAccount(){
        let keys = ["access_token", "expiresDate", "uid"]
        let dict = dictionaryWithValuesForKeys(keys)
        NSUserDefaults.standardUserDefaults().setObject(dict, forKey: ZDWeiBoUserAccountKey)
        ZDAVClassName = "thatday"+uid!
        NSUserDefaults.standardUserDefaults().setObject(ZDAVClassName, forKey: ZDAVClassNamekey)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    //加载账号信息
    func loadUserAccount(){
        guard let dict = NSUserDefaults.standardUserDefaults().objectForKey(ZDWeiBoUserAccountKey) as? [String: AnyObject] else {
            return
        }
        setValuesForKeysWithDictionary(dict)
        if isExpired {
            print("token已经过期了")
            access_token = nil
        }else {
            print("token正常")
        }
        ZDAVClassName = NSUserDefaults.standardUserDefaults().objectForKey(ZDAVClassNamekey) as? String
    }
    override var description: String {
        let keys = ["access_token", "expiresDate"]
        return dictionaryWithValuesForKeys(keys).description
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}
