//
//  DemonMessage.swift
//  lingmantool
//
//  Created by Jacky on 2021/11/10.
//

import Foundation


public class DemonMessage {
    public static func showToast(msg:String){
        UIApplication.shared.windows.last?.makeToast(msg, duration: 2.0, position: .top)
    }
}
