//
//  BaseNavigationController.swift
//  SelfUse
//
//  Created by 梁齐才 on 2018/4/10.
//  Copyright © 2018年 梁齐才. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        interactivePopGestureRecognizer?.delegate = self
    }
}

protocol CanSlider: NSObjectProtocol {
    func canSlideBack() -> Bool
}

extension CanSlider {
    func canSlideBack() -> Bool {
        return true
    }
}

//MARK:- 滑动返回
 extension BaseNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if childViewControllers.count <= 1 {
            return false
        }
        if let top = topViewController as? CanSlider {
            return top.canSlideBack();
        }else{
            return false;
        }
    }
}
