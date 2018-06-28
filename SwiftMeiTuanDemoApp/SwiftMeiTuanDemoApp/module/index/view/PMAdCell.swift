//
//  PMIndexItemsView.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/6/14.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

class PMAdCell:UITableViewCell
{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let width = UIScreen.main.bounds.size.width
        let aimageView = FLAnimatedImageView.init(frame: CGRect(x: 0, y: 0, width: width, height: 100))
        DispatchQueue.global().async {
            let url  = URL.init(string: "https://p1.meituan.net/feop/aa3e9f45ab255ac783918039f2534a08212596.gif")
            let data = try! Data.init(contentsOf: url!)
            DispatchQueue.main.async {
                let image = FLAnimatedImage.init(animatedGIFData: data)
                aimageView.animatedImage = image
            }
        }
        self.contentView.addSubview(aimageView)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
}
