//
//  ZDNetworking.swift
//  thatDay
//
//  Created by dongmei zeng on 16/6/9.
//  Copyright © 2016年 me. All rights reserved.
//

import UIKit
import AFNetworking

enum ZDRequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}
class ZDNetworking: AFHTTPSessionManager {
    
    // MARK: - 微博
    let appkey = "3486182173"
    let redirect_uri = "http://www.baidu.com"
    let appSecret = "6cf9bb1839cc7b152dff6f4949ae844f"
    
    
    // MARK: - 工具类
    static let sharedTool: ZDNetworking = {
        let tool = ZDNetworking(baseURL: nil)
        tool.requestSerializer.timeoutInterval = 15
     tool.responseSerializer.acceptableContentTypes?.insert("text/plain")
       
        return tool
    }()
    var reachable: Bool {
    return reachabilityManager.reachable
    }
    var reachabilityStatus: AFNetworkReachabilityStatus {
    return reachabilityManager.networkReachabilityStatus
    }
    deinit {
        reachabilityManager.stopMonitoring()
    }
///get/post请求
    func request(method: ZDRequestMethod, parameters: [String: AnyObject], urlString: String, finished: (result: [String: AnyObject]?)->()){
        let success = {(task: NSURLSessionTask, responseObject: AnyObject?)->Void in
            if let result = responseObject as? [String: AnyObject] {
                finished(result: result)
            }else {
                finished(result: nil)
                print("数据错误")
            }
        }
        let failure = {(task: NSURLSessionTask?, error: NSError)-> Void in
            print(error)
            finished(result: nil)
        }
        if method == .GET {
            GET(urlString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
        if method == .POST {
            POST(urlString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
    }

    
}
