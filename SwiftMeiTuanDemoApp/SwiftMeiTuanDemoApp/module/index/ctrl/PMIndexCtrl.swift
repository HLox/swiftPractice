//
//  ViewController.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/5/7.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

class PMIndexCtrl: UIViewController {
    
    var indexView:PMIndexView?
    var textField:UITextField?
    
    override func loadView()
    {
        super.loadView()
        self.automaticallyAdjustsScrollViewInsets = false
        self.extendedLayoutIncludesOpaqueBars = true

        self.view.backgroundColor = UIColor.red;
        self.setNavBarView()

        indexView = PMIndexView.init(frame: self.view.bounds)
        self.view.addSubview(indexView!)

        indexView!.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.left.top().right().left().mas_equalTo()(self.view)
            make.bottom.mas_equalTo()(self.view.mas_bottom)?.offset()(-44)
        }

        (indexView!.tableView)!.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
    {
        if keyPath! == "contentOffset" {
            let table = object as! UITableView
            self.navigationController?.setNavigationBarHidden(table.contentOffset.y < -10 , animated: false)
            self.navigationController!.navigationBar.subviews.first?.alpha = table.contentOffset.y/50
            self.navigationController!.navigationBar.tintColor = table.contentOffset.y > 20 ? UIColor(hexStr: "333333") : UIColor.white
            textField!.backgroundColor = table.contentOffset.y > 20 ? UIColor(hexStr: "f4f4f4") : UIColor.white
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        self.navigationController!.navigationBar.subviews.first?.alpha = 0
    }

    
    func setNavBarView()
    {
//      self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//      self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "武汉", style: UIBarButtonItemStyle.done, target: self, action: #selector(test2))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "扫描", style: UIBarButtonItemStyle.done, target: self, action: #selector(test))
        
        textField = UITextField.init(frame: CGRect(x: 0, y: 0, width: self.view.width*0.6, height: 35))
        textField!.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField!.leftViewMode = UITextFieldViewMode.always
        textField!.tintColor = UIColor.blue
        textField!.layer.cornerRadius = 15
        textField!.layer.masksToBounds = true
        textField!.backgroundColor = UIColor.white
        self.navigationItem.titleView = textField
    }
    
    
    @objc func test()
    {

    }
    
    
    @objc func test2()
    {
        
    }

}

