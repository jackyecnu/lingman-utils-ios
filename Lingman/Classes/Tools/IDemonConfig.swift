//
//  DemonConfig.swift
//  lingmantool
//
//  Created by 钟双金 on 2021/11/8.
//

import Foundation
import Swinject

public protocol IDemonConfig {
    func GetApiRoot()->String
    func GetHeaders() -> [String:String]
}
