//
//  FirstPageController.swift
//  SelfUse
//
//  Created by 梁齐才 on 2018/4/10.
//  Copyright © 2018年 梁齐才. All rights reserved.
//

import UIKit

protocol FirstPageControllerDelegate : NSObjectProtocol {
    func itemDidClick(page: FirstPageController, at index: Int)
}

class FirstPageController: BaseController,DiyTabarDelegate{
    
    private var tabbarView: DiyTabar?
    weak var delegate: FirstPageControllerDelegate?
    
    var tabbarSelectedIndex: Int {
        set {
            tabbarView?.selectedIndex = max(0, newValue)
        }
        get{
            return tabbarView?.selectedIndex ?? 0
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVarsAndViews()
    }
    
    private func initVarsAndViews() {
        tabbarView = DiyTabar.init(frame: CGRect.zero)
        tabbarView?.delegate = self
        view.addSubview(tabbarView!)
        tabbarView!.mas_makeConstraints { (make) in
            make?.left.right().bottom().mas_equalTo()(0)
            make?.top.mas_equalTo()(self.lqc_bottomLayoutGuide)?.offset()(-49)
        }
        
    }
    
    //MARK:- 
    func itemDidClick(view: DiyTabar, at index: Int) {
        delegate?.itemDidClick(page: self, at: index)
    }
    
}



//MARK:-
protocol DiyTabarDelegate : NSObjectProtocol {
    func itemDidClick(view: DiyTabar, at index: Int)
}

class DiyTabar: UIView {
    
    private var _selectedIndex = 0
    private var _items: [DiyTabarItem] = [DiyTabarItem]()
    weak var delegate: DiyTabarDelegate?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initVarsAndViews()
    }
    
    var selectedIndex: Int {
        set {
            if newValue < _items.count {
                _items[_selectedIndex].isSelected = false
                _selectedIndex = newValue
                _items[_selectedIndex].isSelected = true
            }
        }
        get {
            return _selectedIndex
        }
    }
    
    private func initVarsAndViews() {
        let titles = ["首页","业务","设置"]
        var lastItem: UIView?
        for (index,title) in titles.enumerated() {
            let item = DiyTabarItem.init(frame: CGRect.zero)
            item.title = title
            item.stateImageTuple = (UIImage.init(named: "tabbar-0\(index + 1)-n"),UIImage.init(named: "tabbar-0\(index + 1)-s"))
            item.stateTitleColorTuple = (UIColor.lightGray,UIColor.KOrange1)
            item.tag = index
            _items.append(item)
            addSubview(item)
            
            item.mas_makeConstraints { (make) in
                make?.top.bottom().mas_equalTo()(0)
            }
            if let _ = lastItem {
                item.mas_makeConstraints { (make) in
                    make?.left.mas_equalTo()(lastItem?.mas_right)
                    make?.width.mas_equalTo()(lastItem?.mas_width)
                }
            } else {
                item.mas_makeConstraints { (make) in
                    make?.left.mas_equalTo()(0)
                }
            }
            
            if index == titles.count - 1 {
                item.mas_makeConstraints { (make) in
                    make?.right.mas_equalTo()(0)
                }
            }
            
            lastItem = item
            
            item.addTarget(self, action: #selector(itemClick(sender:)), for: UIControlEvents.touchUpInside)
        }
        //选择一下
        selectedIndex = 0;
    }
    
    @objc private func itemClick(sender: UIButton) {
        delegate?.itemDidClick(view: self, at: sender.tag)
    }
}


class DiyTabarItem: UIControl {
    
    private let _imageView = UIImageView.init()
    private let _titleLable = UILabel.init(UIFont.systemFont(ofSize: 10), UIColor.lightGray)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initVarsAndViews()
    }
    

    private func initVarsAndViews() {
        addSubview(_imageView)
        addSubview(_titleLable)
        
        _imageView.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(0)
            make?.centerY.mas_equalTo()(-8)
        }
        
        _titleLable.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(0)
            make?.top.mas_equalTo()(_imageView.mas_bottom)?.offset()(3)
        }
    }
    
    
    //MARK: reset content
    var stateImageTuple: (normal: UIImage?, selected: UIImage?)? {
        didSet{
            resetImage()
        }
    }
    
    var stateTitleColorTuple: (normal: UIColor?, selected: UIColor?)? {
        didSet{
           resetTitleColor()
        }
    }
    
    var title:String? {
        didSet{
            _titleLable.text = title
        }
    }
    
    override var isSelected: Bool {
        didSet{
            resetTitleColor()
            resetImage()
        }
    }
    
}


extension DiyTabarItem {
    
    fileprivate func resetImage() {
        let normal = stateImageTuple?.normal
        let selected = stateImageTuple?.selected == nil ? normal : stateImageTuple?.selected
        
        if isSelected {
            _imageView.image = selected
        } else {
            _imageView.image = stateImageTuple?.normal
        }
    }
    
    fileprivate func resetTitleColor() {
        let normal = stateTitleColorTuple?.normal
        let selected = stateTitleColorTuple?.selected == nil ? normal : stateTitleColorTuple?.selected
        
        if isSelected {
            _titleLable.textColor = selected
        } else {
            _titleLable.textColor = normal
        }
    }

}











