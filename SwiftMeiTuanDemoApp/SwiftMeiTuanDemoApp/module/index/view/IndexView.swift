//
//  IndexView.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/5/18.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

class IndexView: UIView, UITableViewDelegate, UITableViewDataSource
{
    var tableView:UITableView?
    var headView:UIView?
    
    required override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupView()
    }

    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    func setupView()
    {
        headView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.width, height: 150))
        headView?.backgroundColor = UIColor.gray
        
        tableView = UITableView.init(frame: self.bounds)
        tableView!.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.tableHeaderView = headView
        tableView!.tableFooterView = UIView.init()
        
        self.addSubview(tableView!)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        return UITableViewCell.init()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 0
    }
    
}
