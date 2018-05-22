//
//  ViewController.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/5/7.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

class IndexCtrl: UIViewController {
    
    var indexView:IndexView?
    
    override func loadView()
    {
        super.loadView()
        self.view.backgroundColor = UIColor.red;
        self.setNavBarView()
        
        indexView = IndexView.init(frame: self.view.bounds)
        self.view.addSubview(indexView!)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        self.view.frame = CGRect(x: self.view.x, y: 0, width: self.view.width, height: self.view.height+64)
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
        
        let textField = UITextField.init(frame: CGRect(x: 0, y: 0, width: self.view.width*0.6, height: 35))
        textField.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = UITextFieldViewMode.always
        textField.tintColor = UIColor.blue
        textField.layer.cornerRadius = 15
        textField.layer.masksToBounds = true
        textField.backgroundColor = UIColor.white
        self.navigationItem.titleView = textField
    }
    
    
    @objc func test()
    {

    }
    
    
    @objc func test2()
    {
        
    }

}

