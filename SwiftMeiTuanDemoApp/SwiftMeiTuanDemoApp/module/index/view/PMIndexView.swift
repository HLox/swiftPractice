//
//  IndexView.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/5/18.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

class PMIndexView: UIView, UITableViewDelegate, UITableViewDataSource
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
        if #available(iOS 11.0, *) {
            tableView!.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        }
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.tableHeaderView = headView
        tableView!.tableFooterView = UIView.init()
        tableView!.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(refresh))

        self.addSubview(tableView!)
    }
    
    
    @objc func refresh()
    {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.tableView!.mj_header.endRefreshing()
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        return UITableViewCell.init()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section != 3 {
            return 1
        }
        return 13
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        if section == 3 {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.width, height: 30))
            label.textAlignment = NSTextAlignment.center
            label.textColor = UIColor.lightGray
            label.font = UIFont.systemFont(ofSize: 14)
            label.text = "—  猜你喜欢  —"
            return label
        }

        let view = UIView()
        view.backgroundColor = UIColor(hexStr: "f4f4f4")
        return view
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if section == 0 {
            return CGFloat.leastNonzeroMagnitude
        }else if section == 3{
            return 30
        }
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.section != 3 {
            return 200.0
        }
        return 100.0
    }
}
