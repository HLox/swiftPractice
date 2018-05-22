//
//  UIColorExt.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/5/22.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit
import Foundation

extension UIColor
{
    convenience init(hexStr: String)
    {
        let scanner = Scanner(string: hexStr)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
         self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
