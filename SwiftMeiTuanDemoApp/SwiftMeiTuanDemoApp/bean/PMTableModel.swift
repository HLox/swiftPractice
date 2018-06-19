//
//  PMTableModel.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/5/24.
//  Copyright © 2018年 liupm. All rights reserved.
//

import Foundation

class PMTableModel:NSObject
{
    var rowHeight:CGFloat = 45
    
    var sectionHeight:CGFloat = CGFloat.leastNonzeroMagnitude
    var sectionBackgroundColor:UIColor = UIColor.white
    var sectionTitle:String = ""
    
    var footerHeight:CGFloat = CGFloat.leastNonzeroMagnitude
    var footerBackgroundColor:UIColor = UIColor.white
    var footerTitle:String = ""
    
    var cellBackgroundColor:UIColor = UIColor.white
    
    var items:Array<Any> = []
    var count:Int{
        return items.count
    }
}
