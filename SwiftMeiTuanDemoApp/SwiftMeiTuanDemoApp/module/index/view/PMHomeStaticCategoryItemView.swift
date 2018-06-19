//
//  PMHomeStaticCategoryItemView.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/6/14.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

class PMHomeStaticCategoryItem: NSObject
{
    var imageUrl:String?
    var title:String?
    var tip:String?
    var itemSize:CGSize?
    var imageSize:CGSize?
    var padding:CGFloat?
}

class PMHomeStaticCategoryItemView: UIView
{
    var imageView:UIImageView?
    var label:UILabel?
    var tipImageView:UIImageView?
    var item:PMHomeStaticCategoryItem?
    
    convenience init(_ frame:CGRect,_ item:PMHomeStaticCategoryItem)
    {
        self.init(frame:frame)
        
        let ax = (item.itemSize!.width - item.imageSize!.width)/2
        
        imageView = UIImageView.init(frame:CGRect(x: ax, y: 8.0, width: item.imageSize!.width, height: item.imageSize!.height))
        imageView?.image = UIImage.init(named: item.imageUrl!)
        imageView?.contentMode = UIViewContentMode.scaleAspectFill
        imageView?.clipsToBounds = true
        
        label = UILabel.init(frame:CGRect(x: 0.0, y: (imageView?.bottom)!+item.padding!,width: self.width, height: 13))
        label?.font = UIFont.systemFont(ofSize: 12.0)
        label?.textColor = UIColor(hexStr: "666666")
        label?.backgroundColor = UIColor.white
        label?.text = item.title
        label?.textAlignment = NSTextAlignment.center
        
        tipImageView = UIImageView.init(frame:CGRect(x: imageView!.right, y: 0.0, width: 30, height: 13))
        tipImageView?.isHidden = true
        tipImageView?.backgroundColor = UIColor.red
        
        self.addSubview(imageView!)
        self.addSubview(label!)
        self.addSubview(tipImageView!)
    }
    
    
    
}
