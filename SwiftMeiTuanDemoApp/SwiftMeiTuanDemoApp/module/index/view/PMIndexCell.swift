//
//  PMIndexCell.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/6/27.
//  Copyright © 2018年 liupm. All rights reserved.
//

//{
//    "imageUrl": "http://p0.meituan.net/waimaipoi/584d78313267bfd2d4d89993f250958d38912.jpg.webp",
//    "imageTag": "0",
//    "title": "湘香小碗菜（洪山广场地铁站D出口负二楼馋）",
//    "imageTitle": "http://p0.meituan.net/groupop/df92b87c4a50cb952406cb116ecf02691800.png",
//    "subTitle": "30分钟送达",
//    "subTitle2": "起送价¥20|配送费¥3.1",
//    "subMessage": "满25减13, 满35减17",
//    "bottomRightInfo": "月售30",
//    "_type": "waimai",
//    "_from": "POI_WAIMAI",
//    "_id": "160439971",
//    "_iUrl": "imeituan://www.meituan.com/takeout/foods?poi_id=4692084&ct_poi=338773869711344514302670368342712213807_c0_e74ee13ccaeb2efd99af668893deae1bd_f160439971&g_source=4",
//    "color": {
//        "reason": "#F58300",
//        "reason_BackGround": "#FEF6EC",
//        "subTitle": "#999999",
//        "mainMessage": "#06c1ae",
//        "bottomRightInfo": "#999999",
//        "mainMessage2": "#06c1ae",
//        "topRightInfo": "#999999",
//        "title": "#333333",
//        "subMessage": "#06c1ae"
//    },

import UIKit

class PMIndexItem:NSObject
{
    var imageUrl:String?
    var title:String?
    var imageTitleUrl:String?
    var subTitle:String?
    var priceInfo:String?
    var discountInfo:String?
    var soldInfo:String?
    var color:Dictionary<String, String>?
}


class PMIndexCell:UITableViewCell
{
    var itemImageView:UIImageView?
    var titleLabel:UILabel?
    var subLabel:UILabel?
    var priceLabel:UILabel?
    var discountLabel:UILabel?
    var soldLabel:UILabel?
    var titleImageView:UIImageView?
    var item:PMIndexItem{
        set(newItem){
            let width = UIScreen.main.bounds.size.width
            
            if newItem.imageUrl != nil{
                self.itemImageView?.sd_setImage(with: URL.init(string: newItem.imageUrl!), completed: nil)
            }else{
                self.itemImageView?.image = nil
            }
            
            if newItem.imageTitleUrl != nil{
                self.titleImageView?.sd_setImage(with: URL.init(string: newItem.imageTitleUrl!), completed: nil)
            }else{
                self.titleImageView = nil
            }

            if newItem.title != nil{
                self.titleLabel?.text = newItem.title
                self.titleLabel?.textColor = UIColor.init(hexStr:newItem.color!["title"]!)
                var titleSize = self.titleLabel?.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: (self.titleLabel?.height)!))
                if titleSize!.width>width*0.5 {
                    titleSize!.width = width*0.5
                }
                self.titleLabel!.mas_updateConstraints({ (make:MASConstraintMaker!) in
                    make.width.mas_equalTo()(titleSize?.width)
                })
            }else{
                self.titleLabel?.text = ""
            }

            if newItem.subTitle != nil{
                self.subLabel?.text = newItem.subTitle
                self.subLabel?.textColor = UIColor.init(hexStr:newItem.color!["subTitle"]!)
            }else{
                self.subLabel?.text = ""
            }

            if newItem.priceInfo != nil{
                self.priceLabel?.text = newItem.priceInfo
                self.priceLabel?.textColor = UIColor.init(hexStr:newItem.color!["subTitle"]!)
                var titleSize = self.priceLabel?.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: (self.priceLabel?.height)!))
                if titleSize!.width>width*0.5 {
                    titleSize!.width = width*0.5
                }
                self.priceLabel!.mas_updateConstraints({ (make:MASConstraintMaker!) in
                    make.width.mas_equalTo()(titleSize?.width)
                })

            }else{
                self.priceLabel?.text = ""
            }
            
            if newItem.soldInfo != nil{
                self.soldLabel?.text = newItem.soldInfo
                self.soldLabel?.textColor = UIColor.init(hexStr:newItem.color!["bottomRightInfo"]!)
                self.soldLabel?.sizeToFit()
                self.soldLabel!.mas_updateConstraints({ (make:MASConstraintMaker!) in
                    make.right.equalTo()(self.contentView.mas_right)?.offset()(-10)
                })
            }else{
                self.soldLabel?.text = ""
            }

            if newItem.discountInfo != nil{
                self.discountLabel?.isHidden = false
                self.discountLabel?.text = newItem.discountInfo
                self.discountLabel?.backgroundColor = UIColor.init(hexStr:"#FFF5F5")
                self.discountLabel?.textColor = UIColor.init(hexStr: "#F82E30")
                self.discountLabel?.sizeToFit()
                self.discountLabel!.mas_updateConstraints({ (make:MASConstraintMaker!) in
                    make.width.mas_equalTo()(self.discountLabel!.width+10)
                })
            }else{
                self.discountLabel?.isHidden = true
            }


        }
        get{
            return self.item
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        itemImageView = UIImageView.init()
        itemImageView?.contentMode = UIViewContentMode.scaleAspectFill
        itemImageView?.clipsToBounds = true
        itemImageView?.layer.cornerRadius = 3
        itemImageView?.layer.masksToBounds = true
        
        titleLabel = UILabel.init()
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        titleImageView = UIImageView.init()
        
        subLabel = UILabel.init()
        subLabel?.font = UIFont.systemFont(ofSize: 11)
        
        priceLabel = UILabel.init()
        priceLabel?.font = UIFont.systemFont(ofSize: 11)
        
        discountLabel = UILabel.init()
        discountLabel?.font = UIFont.systemFont(ofSize: 10)
        discountLabel?.layer.cornerRadius = 2
        discountLabel?.layer.masksToBounds = true
        discountLabel?.textAlignment = NSTextAlignment.center

        soldLabel = UILabel.init()
        soldLabel?.font = UIFont.systemFont(ofSize: 12)

        self.contentView.addSubview(itemImageView!)
        self.contentView.addSubview(titleLabel!)
        self.contentView.addSubview(titleImageView!)
        self.contentView.addSubview(subLabel!)
        self.contentView.addSubview(priceLabel!)
        self.contentView.addSubview(discountLabel!)
        self.contentView.addSubview(soldLabel!)
        
        itemImageView!.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.top.mas_equalTo()(self.contentView)?.offset()(15)
            make.bottom.mas_equalTo()(self.contentView)?.offset()(-15)
            make.left.mas_equalTo()(15)
            make.width.mas_equalTo()(80)
        })
        
        titleLabel!.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.top.equalTo()(itemImageView)
            make.left.equalTo()(itemImageView?.mas_right)?.offset()(15)
            make.height.mas_equalTo()(15)
        }
        
        titleImageView!.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.width.mas_equalTo()(25)
            make.height.mas_equalTo()(14)
            make.top.mas_equalTo()(titleLabel)?.offset()(2)
            make.left.mas_equalTo()(titleLabel?.mas_right)?.offset()(10)
        }
        
        subLabel!.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.top.equalTo()(titleLabel?.mas_bottom)?.offset()(3)
            make.left.equalTo()(titleLabel)
            make.height.mas_equalTo()(20)
            make.width.mas_equalTo()(self.contentView)?.multipliedBy()(0.6)
        }
        
        priceLabel!.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.top.equalTo()(subLabel?.mas_bottom)
            make.left.equalTo()(subLabel)
            make.height.mas_equalTo()(20)
        })
        
        soldLabel!.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.top.equalTo()(priceLabel)
            make.right.equalTo()(self.contentView.mas_right)?.offset()(-10)
            make.height.mas_equalTo()(20);
        }
        
        discountLabel!.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.top.equalTo()(priceLabel?.mas_bottom)?.offset()(5)
            make.left.equalTo()(subLabel)
            make.height.equalTo()(18)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
