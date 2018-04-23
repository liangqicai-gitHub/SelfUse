//
//  IntExtension.swift
//  SelfUse
//
//  Created by 梁齐才 on 2018/4/11.
//  Copyright © 2018年 梁齐才. All rights reserved.
//

import Foundation

// MARK:- 如果你不能准确判断一个object的数据类型，那下面这个方法可以实现对：Int String NSNumber 对Int的转化
extension Int {
    static func newByAny(object: Any) -> Int {
        switch object {
        case is Int:
            return object as! Int
        case let string as String:
            let value = Int(string)
            return value == nil ? 0 : value!
        case let number as NSNumber:
            return number.intValue
        default:
            return 0
        }
    }
}
