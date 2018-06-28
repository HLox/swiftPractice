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
        
        let images = ["i1","i2","i3","i4","i5"]
        let titles = ["美食","电影/演出","酒店住宿","休闲娱乐","外卖"]

        for i in 0..<images.count {
            let item:PMHomeStaticCategoryItem = PMHomeStaticCategoryItem.init()
            item.itemSize = CGSize(width: UIScreen.main.bounds.size.width/5, height: 80)
            item.imageSize = CGSize(width: 53, height: 53)
            item.padding = 0;
            item.imageUrl = images[i]
            item.title = titles[i]
            let itemView = PMHomeStaticCategoryItemView.init(CGRect(x: CGFloat(i)*(item.itemSize?.width)!, y: 10, width: (item.itemSize?.width)!, height: (item.itemSize?.height)!), item)
            self.contentView.addSubview(itemView)
        }
        
        let line:UIView = UIView.init(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 0.5))
        line.backgroundColor = UIColor.init(hexStr: "f4f4f4")
        self.contentView.addSubview(line)
        
        let images2 = ["http://p1.meituan.net/jungle/5e4b6225d8b94b665dea5897297474681454.png.webp",
                                "http://p1.meituan.net/jungle/6889c7137fa39a6cb067cd381081c3181276.png.webp",
                                "http://p1.meituan.net/jungle/ee145db0b2f939e1edc568c68a5cf2771273.png.webp",
                                "http://p1.meituan.net/jungle/06f3a4fa01403693ed00b2bd4d13d9af1949.png.webp",
                                "http://p0.meituan.net/jungle/dbe9786ef3ec0b44ed7d38bba40fb7501204.png.webp",
                                "http://p0.meituan.net/jungle/2abef70b0e0e85c61e4ec433df970c921282.png.webp",
                                "http://p1.meituan.net/jungle/010e23731fb36f9a2f1f820ff3aca34c1327.png.webp",
                                "http://p1.meituan.net/jungle/0b76fd307054d2b065fb300b1b10bae81541.png.webp",
                                "http://p0.meituan.net/jungle/85f7cd02be1171c50ef0c3c174ce57331285.png.webp",
                                "http://p0.meituan.net/jungle/51871955b1fb605ebad4e6e038eca961227.png.webp"]
        let titles2 = ["亲子/乐园","民宿/公寓","周边游/旅游","机票/火车票","学习培训","景点/门票","结婚/摄影","丽人/美发","运动健身","全部分类"]

        for j in 0..<10 {
            let item:PMHomeStaticCategoryItem = PMHomeStaticCategoryItem.init()
            item.itemSize = CGSize(width: UIScreen.main.bounds.size.width/5, height: 58)
            item.imageSize = CGSize(width: 25, height: 20)
            item.padding = 10;
            item.imageUrl = images2[j]
            item.title = titles2[j]
            let ax = CGFloat(j%5)*item.itemSize!.width
            let ay = CGFloat(j/5)*item.itemSize!.height+95+10*(CGFloat(j/5)+1)
            let itemView = PMHomeStaticCategoryItemView.init(CGRect(x: ax, y: ay, width: item.itemSize!.width, height: item.itemSize!.height), item)
            self.contentView.addSubview(itemView)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
