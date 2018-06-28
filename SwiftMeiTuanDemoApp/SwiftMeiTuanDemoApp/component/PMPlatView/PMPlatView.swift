//
//  PMPlatView.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/6/21.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

class PMPlatItem: NSObject
{
    var titleImage:String?
    var title:String?
    var subTitle:String?
    var bottomImage:String?
    var bgImage:String?
    var itemImage:String?
}


class PMPlatView:UIView
{
    var row:Int?
    var dataSource:Array<PMPlatItem>?
    
    convenience init(_ frame:CGRect,_ datas:Array<PMPlatItem>,_ row:Int)
    {
        self.init(frame: frame)

        var cloum = datas.count % row
        if cloum == 0 {
            cloum = datas.count / row
        }else{
            cloum = (datas.count - cloum)/(row-1)
        }

        let xPad = CGFloat(5.0)
        let yPad = CGFloat(5.0)
        var itemWidth = (self.width-CGFloat(cloum-1)*xPad)/CGFloat(cloum)
        let itemHeight = (self.height-CGFloat(row-1)*yPad)/CGFloat(row)

        for i in 0..<row{
            for j in 0..<cloum{
                let index = cloum*i+j
                let lastIndex = datas.count-1
                if lastIndex == index{
                    let lastCloum = datas.count % row
                    if lastCloum > 0{
                        itemWidth = (self.width-CGFloat(lastCloum-1)*xPad)/CGFloat(lastCloum)
                    }
                }
                if index < datas.count{
                    let item = datas[index]
                    var itemX = CGFloat(j)*itemWidth
                    var itemY = CGFloat(i)*itemHeight
                    if itemX > 0{
                        itemX += xPad
                    }
                    if itemY > 0{
                        itemY += yPad
                    }
                    let contentView = UIView.init(frame: CGRect(x: itemX, y: itemY, width: itemWidth, height: itemHeight))
                    
                    let itemImage = UIImageView.init(frame: CGRect(x: itemWidth-90, y: itemHeight-90, width: 90, height: 90))
                    itemImage.contentMode = UIViewContentMode.scaleAspectFill
                    itemImage.clipsToBounds = true
                    itemImage.sd_setImage(with: URL.init(string: item.itemImage!), completed: nil)
                    
                    let bgImage = UIImageView.init(frame: CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight))
                    bgImage.sd_setImage(with: URL.init(string: item.bgImage!), completed: nil)

                    let titleImage = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 75, height: 20))
                    titleImage.sd_setImage(with: URL.init(string: item.titleImage!), completed: nil)
                    
                    let title = UILabel.init(frame: CGRect(x: 5, y: titleImage.bottom, width: itemWidth-10, height: 30))
                    title.text = item.title;
                    title.font = UIFont.boldSystemFont(ofSize: 14.0)
                    
                    contentView.addSubview(itemImage)
                    contentView.addSubview(bgImage)
                    contentView.addSubview(titleImage)
                    contentView.addSubview(title)
                    
                    self.addSubview(contentView)
                }
            }
        }
    }
}
