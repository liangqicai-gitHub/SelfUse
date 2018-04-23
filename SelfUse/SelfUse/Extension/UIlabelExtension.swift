//
//  UIlabelExtension.swift
//  SelfUse
//
//  Created by 梁齐才 on 2018/4/11.
//  Copyright © 2018年 梁齐才. All rights reserved.
//

import UIKit

extension UILabel {
    
   
    
    
    
    convenience init(_ font: UIFont,
                     _ textColor: UIColor = UIColor.KOrange1,
                     _ numberOfLines: Int = 1,
                     _ textAlignment: NSTextAlignment = NSTextAlignment.left,
                     _ text: Any? = nil)
    {
        self.init(frame: CGRect.zero)
        
        self.font = font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.anyText = text
    }
    
 
    
    
    
    
    var anyText: Any? {
        get {
            return self.text
        }
        set {
            self.text = newValue as? String
        }
    }
}




