//
//  Constant.swift
//  SelfUse
//
//  Created by 梁齐才 on 2018/4/11.
//  Copyright © 2018年 梁齐才. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift
import LQCCategory


extension UIColor {
    public static var KOrange1: UIColor {return UIColor.init(hex6: 0xff5722)}
    public static var KOrange2: UIColor {return UIColor.init(hex6: 0x795548)}
}

extension UIFont {
    public static var KFont1: UIFont {return UIFont.systemFont(ofSize: 13)}
    public static var KFont1B: UIFont {return UIFont.boldSystemFont(ofSize: 13)}
}


extension NSNotification.Name {
    static let KNotUserChange: NSNotification.Name = NSNotification.Name.init("KNotUserChange")
}




