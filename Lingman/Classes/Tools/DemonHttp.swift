//
//  DemonHttp.swift
//  lingmantool
//
//  Created by Jacky on 2021/11/9.
//

import Foundation
import Alamofire
import SVProgressHUD
import Toast_Swift
import CoreLocation

public class DemonHttp {

    
    public static  func load<T:Codable>(api:ApiModel<T>, success:((T)->Void)?, failure: ((RespModel<T>) ->Void)? = nil,  showHUD:Bool = false)  {
        if(showHUD) {
            // 发送
            SVProgressHUD.show()
        }
         
        var myRequest = URLRequest(url: try! api.url.asURL())
        myRequest.httpMethod =  api.method.rawValue
        myRequest.allHTTPHeaderFields = DemonContainer.container.resolve(IDemonConfig.self)!.GetHeaders()
        if myRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            myRequest.setValue("form-data", forHTTPHeaderField: "Content-Disposition")
            myRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        if let body = api.body {
            myRequest.httpBody = try! JSONSerialization.data(withJSONObject: body, options: [])
        }
         
     
        AF.request(myRequest).responseJSON { response in
            debugPrint(response)
            if showHUD {
                SVProgressHUD.dismiss()
            }
           
            if response.error == nil {
                if(response.response?.statusCode == 200) {
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let resp = try decoder.decode(RespModel<T>.self, from: data)
                        switch(resp.code) {
                        case 1:
                            success?(resp.data)
                            break
                        case 401:
                            DemonMessage.showToast(msg: "退出登录")
                            break
                        default:
                            if(failure == nil) {
                                failure?(resp)
                            }else {
                                DemonMessage.showToast(msg: resp.message ?? "")
                            }
                        }
                        
                    } catch let error {
                        print(error)
                     
                    }
                    
                
                    
                    
                    
                   
                }else {
                    self.requestDataFailed(error: "请求参数错误\(response.response!.statusCode)"   )
                }
            }else {
              self.requestDataFailed(error: "服务器繁忙")
            }
        }
    }

  
    
    
    
    
    
    /**
     网络请求失败
     
     - parameter error: 失败描述
     */
   public static func requestDataFailed(error:String)
   {
     
        UIApplication.shared.windows.last?.makeToast(error, duration: 2.0, position: .top)
    }
}

open class ApiModel<T>{
    public init(url:String, method:HTTPMethod, body:[String:Any]? ) {
        self.url = url.hasPrefix("http") ? url : DemonContainer.container.resolve(IDemonConfig.self)!.GetApiRoot() + (url.hasPrefix("/") ?  url[1...] : url)
        self.method = method
        self.body = body
        
    }
    var url:String
    var method:HTTPMethod
    var body:[String:Any]?
    
}

public class RespModel<T:Codable>:Codable {
    public var code : Int
    public var message:String?
    public var data:T
}

 
