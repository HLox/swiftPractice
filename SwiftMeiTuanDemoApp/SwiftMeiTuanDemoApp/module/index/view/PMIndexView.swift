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
    lazy var headView:PMLoopScrollView? = {()->PMLoopScrollView in
        let item1 = PMLoopScrollViewItem.init()
        item1.imageUrl = "1.jpg"
        let item2 = PMLoopScrollViewItem.init()
        item2.imageUrl = "2.jpg"
        let item3 = PMLoopScrollViewItem.init()
        item3.imageUrl = "3.jpg"
        let item4 = PMLoopScrollViewItem.init()
        item4.imageUrl = "4.jpg"
        
        let array:Array<PMLoopScrollViewItem> = [item1,item2,item3,item4];
        let aheadView = PMLoopScrollView.init(CGRect(x: 0, y: 0, width: self.width, height: 200),array)
        aheadView.backgroundColor = UIColor.gray
        return aheadView
    }()
    
    var dataSource:Array<PMTableModel>? = []
    
    required override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupView()
        self.refreshDatas(datas: [])
    }

    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    private func setupView()
    {
        tableView = UITableView.init(frame: self.bounds)
        self.addSubview(tableView!)
        tableView!.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.left.right().top().bottom().mas_equalTo()(self)
        })
        
        if #available(iOS 11.0, *) {
            tableView!.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        }
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.tableHeaderView = headView
        tableView!.tableFooterView = UIView.init()
        tableView!.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(refresh))
        tableView!.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(loadMore))
        tableView!.separatorInset = UIEdgeInsets.zero
    }

    
     @objc private func refresh()
    {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.tableView!.mj_header.endRefreshing()
        }
    }
    
    
    @objc private func loadMore()
    {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.tableView!.mj_footer.endRefreshing()
        }
    }
    
    
    func refreshDatas(datas:Array<PMTableModel>?)
    {
        dataSource = datas!
        
        let model1 = PMTableModel.init()
        model1.rowHeight = 220
        model1.items = ["1"]
        
        let model2 = PMTableModel.init()
        model2.sectionBackgroundColor = UIColor(hexStr: "f4f4f4")
        model2.rowHeight = 300
        model2.items = ["1"]
        model2.sectionHeight = 10
        model2.sectionBackgroundColor = UIColor(hexStr: "f4f4f4")

        let model3 = PMTableModel.init()
        model3.sectionBackgroundColor = UIColor(hexStr: "f4f4f4")
        model3.rowHeight = 150
        model3.sectionHeight = 10
        model3.footerHeight = 10
        model3.footerBackgroundColor = UIColor(hexStr: "f4f4f4")
        model3.items = ["1"]
        
        let model4 = PMTableModel.init()
        model4.sectionBackgroundColor = UIColor(hexStr: "ffffff")
        model4.sectionHeight = 30
        model4.rowHeight =  100
        model4.sectionTitle = "—  猜你喜欢  —"
        model4.items = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
        
        dataSource!.append(model1)
        dataSource!.append(model2)
        dataSource!.append(model3)
        dataSource!.append(model4)
        
        tableView!.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let identifier = String(indexPath.section)
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            if indexPath.section == 0{
                cell = PMIndexItemsCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
                cell?.selectionStyle = UITableViewCellSelectionStyle.none
            }else{
                cell = UITableViewCell.init();
            }
        }

        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let model = dataSource![section]
        return model.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return dataSource!.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let model = dataSource![section]
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.width, height: model.sectionHeight))
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = model.sectionTitle
        label.backgroundColor = model.sectionBackgroundColor
        return label
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        let model = dataSource![section]
        return model.sectionHeight
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        let model = dataSource![section]
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.width, height: model.footerHeight))
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = model.footerTitle
        label.backgroundColor = model.footerBackgroundColor
        return label
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        let model = dataSource![section]
        return model.footerHeight
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let model = dataSource![indexPath.section]
        return model.rowHeight
    }
}
