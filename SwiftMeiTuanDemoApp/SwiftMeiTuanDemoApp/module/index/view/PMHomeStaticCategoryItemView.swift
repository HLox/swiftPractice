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
}

class PMHomeStaticCategoryItemCell: UIView
{
    var imageView:UIImageView?
    var label:UILabel?
    var tipImageView:UIImageView?
    var item:PMHomeStaticCategoryItem?
    
    
    convenience init(_ frame:CGRect,_ item:PMHomeStaticCategoryItem)
    {
        self.init(frame:frame)
        
        imageView = UIImageView.init(frame:CGRect(x: 10.0, y: 10.0, width: self.width-20, height: self.width-20))
        imageView?.image = UIImage.init(named: item.imageUrl!)
        imageView?.backgroundColor = UIColor.red
        
        label = UILabel.init(frame:CGRect(x: 0.0, y: (imageView?.bottom)!,width: self.width, height: 30))
        label?.font = UIFont.systemFont(ofSize: 12.0)
        label?.textColor = UIColor.lightGray
        label?.backgroundColor = UIColor.gray
        
        tipImageView = UIImageView.init(frame:CGRect(x: imageView!.right, y: 0.0, width: 30, height: 20))
        tipImageView?.isHidden = true
        tipImageView?.backgroundColor = UIColor.red
        
        self.addSubview(imageView!)
        self.addSubview(label!)
        self.addSubview(tipImageView!)
    }
    
    
    
}
