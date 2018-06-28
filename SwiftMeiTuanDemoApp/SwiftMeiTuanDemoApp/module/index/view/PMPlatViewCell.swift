//
//  PMIndexItemsView.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/6/14.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

class PMPlatViewCell:UITableViewCell
{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let width = UIScreen.main.bounds.size.width
        
        
        let itemImages = ["https://p0.meituan.net/deal/36edc4a9e5ebc1fd5044ac7388675bea101917.jpeg@600w_600h_1l.webp",
                          "https://p0.meituan.net/waimaipoi/855b75c4bfca1c51a5c1e65061a865499740.jpeg@600w_600h_1l.webp",
                          "https://p1.meituan.net/deal/902495067f50751da6ebafd27341144c58551.jpg@600w_600h_1l.webp",
                          "https://p1.meituan.net/hotel/62ce5fb16335acbdd78c823c981e80d08701952.jpg@600w_600h_1l.webp"]
        
        let titleImages = ["https://p0.meituan.net/codeman/b7e49f8ad4e6c78e72da7856ff26285e2530.png@200h_200w_1e.webp",
                           "https://p1.meituan.net/codeman/eacb8aaed62dfca96bde2b666799498f4131.png@200h_200w_1e.webp",
                           "https://p1.meituan.net/codeman/10c3dff6f94377b6bf618dc49ce958db2988.png@200h_200w_1e.webp",
                           "https://p1.meituan.net/codeman/12675ff335aeb9384f3c7ad842915dd13653.png@200h_200w_1e.webp"]
        
        let bgImages = ["https://p1.meituan.net/codeman/17f6e5a1a31d135da927c902be62ea4f9262.png@229h_347w_1e.webp",
                        "https://p1.meituan.net/codeman/cface68b0264d3bce2296e455960043011118.png@229h_347w_1e.webp",
                        "https://p1.meituan.net/codeman/2eb6e0374bce777a374748359e9f400611876.png@229h_347w_1e.webp",
                        "https://p0.meituan.net/codeman/cedafb267555381dabc4f9291d2bedbd9352.png@229h_347w_1e.webp"]
        
        let titles = ["龙门花甲","西贝筱面村","轻粹沙拉","嗨派蛙水乐园"]

        var datas = Array<PMPlatItem>.init()
        for i in 0..<4{
            let item:PMPlatItem = PMPlatItem.init()
            item.title = titles[i]
            item.itemImage = itemImages[i]
            item.titleImage = titleImages[i]
            item.bgImage = bgImages[i]
            datas.append(item)
        }
        
        let platView = PMPlatView.init(CGRect(x: 10, y: 10, width: width-20, height: 250), datas, 2)
        self.contentView.addSubview(platView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
