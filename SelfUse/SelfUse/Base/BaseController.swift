//
//  BaseController.swift
//  SelfUse
//
//  Created by 梁齐才 on 2018/4/10.
//  Copyright © 2018年 梁齐才. All rights reserved.
//

import UIKit
import Masonry
import Alamofire
import SDWebImage
import UIColor_Hex_Swift
import SwiftyJSON

class BaseController: UIViewController, CanSlider {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.white
    }
    
}


extension UIViewController {
    var lqc_bottomLayoutGuide: MASViewAttribute {
        if #available(iOS 11.0, *) {
            return self.view.mas_safeAreaLayoutGuideBottom
        } else {
            return self.mas_bottomLayoutGuide
        }
    }
    
    var lqc_topLayoutGuide: MASViewAttribute {
        if #available(iOS 11.0, *) {
            return self.view.mas_safeAreaLayoutGuideTop
        } else {
            return self.mas_topLayoutGuide
        }
    }
    
    
}
