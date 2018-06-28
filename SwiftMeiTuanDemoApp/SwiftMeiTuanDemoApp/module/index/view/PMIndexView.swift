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
        item1.imageUrl = "https://img.meituan.net/midas/eda170b2975175f80096ab0c0805826b96737.jpg.webp"
        let item2 = PMLoopScrollViewItem.init()
        item2.imageUrl = "http://p0.meituan.net/feop/7ba86428fc0a4df5bde14caeab93bfe5121260.jpg.webp"
        let item3 = PMLoopScrollViewItem.init()
        item3.imageUrl = "http://p0.meituan.net/adunion/f779f2e952db465145e13f4b805f81b685340.gif"
        let item4 = PMLoopScrollViewItem.init()
        item4.imageUrl = "http://p1.meituan.net/adunion/2462d0788741656f8d893a231eabd2c9118519.jpg.webp"
        let item5 = PMLoopScrollViewItem.init()
        item5.imageUrl = "http://p1.meituan.net/feop/5163ca15c5773ce4060266515ff3d0b1178694.jpg.webp"
        let item6 = PMLoopScrollViewItem.init()
        item6.imageUrl = "http://p1.meituan.net/feop/be2f8b373bb196b2a778ebec22c04cee156293.png.webp"
        let item7 = PMLoopScrollViewItem.init()
        item7.imageUrl = "http://p1.meituan.net/feop/49423940008932cbc88f76eae945363e118749.jpg.webp"

        let array:Array<PMLoopScrollViewItem> = [item1,item2,item3,item4,item5,item6,item7];
        let aheadView = PMLoopScrollView.init(CGRect(x: 0, y: 0, width: self.width, height: 160),array)
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
        tableView!.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0)
        tableView!.separatorColor = UIColor.init(hexStr: "#e4e4e4")
        tableView?.showsVerticalScrollIndicator = false
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
        model1.rowHeight = 240
        model1.items = ["1"]
        
        let model2 = PMTableModel.init()
        model2.sectionBackgroundColor = UIColor(hexStr: "f4f4f4")
        model2.rowHeight = 270
        model2.items = ["1"]
        model2.sectionHeight = 10
        model2.sectionBackgroundColor = UIColor(hexStr: "f4f4f4")

        let model3 = PMTableModel.init()
        model3.sectionBackgroundColor = UIColor(hexStr: "f4f4f4")
        model3.rowHeight = 100
        model3.sectionHeight = 10
        model3.footerHeight = 10
        model3.footerBackgroundColor = UIColor(hexStr: "f4f4f4")
        model3.items = ["1"]
        
        let model4 = PMTableModel.init()
        model4.sectionBackgroundColor = UIColor(hexStr: "ffffff")
        model4.sectionHeight = 30
        model4.rowHeight =  110
        model4.sectionTitle = "—  猜你喜欢  —"
        model4.items = Array.init()
        
        let datasUrl = Bundle.main.path(forResource: "Datas", ofType: "json")
        let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: datasUrl!))
        let datas:Dictionary<String,Any> = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String,Any>
//        let data2:Array = datas["data"] as! Array
        let items:Array<Dictionary> = datas["data"] as! Array<Dictionary< String,Any>>
        for value in items {
            let item = PMIndexItem.init()
            item.title = value["title"] as? String
            item.imageUrl = value["imageUrl"] as? String
            item.subTitle = value["subTitle"] as? String
            item.priceInfo = value["subTitle2"] as? String
            item.soldInfo = value["bottomRightInfo"] as? String
            item.discountInfo = value["subMessage"] as? String
            item.imageTitleUrl = value["imageTitle"] as? String
            item.color = value["color"] as? Dictionary<String,String>
            model4.items.append(item)
        }
        
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
            }else if indexPath.section == 1{
                cell = PMPlatViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
                cell?.selectionStyle = UITableViewCellSelectionStyle.none
            }else if indexPath.section == 2{
                cell = PMAdCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
                cell?.selectionStyle = UITableViewCellSelectionStyle.none
            }else{
                cell = PMIndexCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
            }
        }
        
        if indexPath.section == 3 {
            let indexCell:PMIndexCell = cell as! PMIndexCell
            let model = dataSource![indexPath.section]
            indexCell.item = model.items[indexPath.row] as! PMIndexItem
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
        label.font = UIFont.systemFont(ofSize: 13)
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
        label.font = UIFont.systemFont(ofSize: 13)
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
