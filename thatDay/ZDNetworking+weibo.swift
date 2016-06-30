//
//  ZDNetworking+weibo.swift
//  thatDay
//
//  Created by dongmei zeng on 16/6/18.
//  Copyright © 2016年 me. All rights reserved.
//

import Foundation

extension ZDNetworking {

    var urlOAuth: NSURL {
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(appkey)&redirect_uri=\(redirect_uri)"
        
        return NSURL(string: urlString)!
    }
 
    func loadAccessToken(code: String, finished: (result: [String: AnyObject]?)->()){
        
        let parameters = ["client_id": appkey,
                    "client_secret": appSecret,
                    "grant_type": "authorization_code",
                    "code": code,
                    "redirect_uri": redirect_uri]
        let urlString = "https://api.weibo.com/oauth2/access_token"
    
        request(.POST, parameters: parameters, urlString: urlString) { (result) in
            
            // result 是 token 的结果字典，是可选的！
            // 如果要使用 key 从字典中取值，必须保证字典存在
            guard let result = result,
                let access_token = result["access_token"] as?String,
                let uid = result["access_token"] as? String else {
                    print("数据格式不正确")
                    // 一定要完成回调，通知调用方请求失败
                    finished(result: nil)
                    return
            }
            finished(result: result)
            print(result)
        }

    }
    
}