//
//  RootController.swift
//  SelfUse
//
//  Created by 梁齐才 on 2018/4/10.
//  Copyright © 2018年 梁齐才. All rights reserved.
//

import UIKit

class RootController: UITabBarController,FirstPageControllerDelegate {
  
    private lazy var _pages: [FirstPageController] = [FirstPageController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
        buildSubControllerS()
    }
    
    private func buildSubControllerS() {
        let pageItem = LQItemController.init()
        let pageEarn = LQEarnController.init()
        let pageSetting = LQSettingController.init()
        _pages.append(contentsOf: [pageItem,pageEarn,pageSetting])
        viewControllers = _pages
        
        for page in _pages {
            page.delegate = self
        }
    }
    
    
    override var selectedIndex: Int {
        set {
            super.selectedIndex = max(0, newValue)
            for page in _pages {
                page.tabbarSelectedIndex = super.selectedIndex
            }
        }
        get {
            return super.selectedIndex
        }
    }
    
    func itemDidClick(page: FirstPageController, at index: Int) {
        selectedIndex = index
    }
    
}
