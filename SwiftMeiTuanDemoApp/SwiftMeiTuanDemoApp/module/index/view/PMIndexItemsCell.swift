//
//  PMIndexItemsView.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/6/14.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

class PMIndexItemsCell:UITableViewCell
{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let images = ["item1","item1","item1","item1","item1"]
        let titles = ["美食","电影/演出","酒店住宿","休闲娱乐","外卖"]

        for i in 0..<images.count {
            let item:PMHomeStaticCategoryItem = PMHomeStaticCategoryItem.init()
            item.itemSize = CGSize(width: UIScreen.main.bounds.size.width/5, height: 75)
            item.imageSize = CGSize(width: 46, height: 46)
            item.padding = 3;
            item.imageUrl = images[i]
            item.title = titles[i]
            let itemView = PMHomeStaticCategoryItemView.init(CGRect(x: CGFloat(i)*(item.itemSize?.width)!, y: 0, width: (item.itemSize?.width)!, height: (item.itemSize?.height)!), item)
            self.contentView.addSubview(itemView)
        }
        
        let images2 = ["item2","item2","item2","item2","item2","item2","item2","item2","item2","item2"]
        let titles2 = ["学习培训","民宿/公寓","周边游/旅游","机票/火车票","亲子/乐园","结婚/摄影","丽人/美发","景点/门票","跑腿代购","全部分类"]

        for j in 0..<10 {
            let item:PMHomeStaticCategoryItem = PMHomeStaticCategoryItem.init()
            item.itemSize = CGSize(width: UIScreen.main.bounds.size.width/5, height: 58)
            item.imageSize = CGSize(width: 30, height: 25)
            item.padding = 10;
            item.imageUrl = images2[j]
            item.title = titles2[j]
            let ax = CGFloat(j%5)*item.itemSize!.width
            let ay = CGFloat(j/5)*item.itemSize!.height+75+10*(CGFloat(j/5)+1)
            let itemView = PMHomeStaticCategoryItemView.init(CGRect(x: ax, y: ay, width: item.itemSize!.width, height: item.itemSize!.height), item)
            self.contentView.addSubview(itemView)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
