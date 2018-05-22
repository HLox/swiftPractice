//
//  UIViewExt.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/5/21.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

extension UIView
{
    var x:CGFloat {
        set(newX) {
            self.frame = CGRect(x: newX, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height)
        }
        get {
            return self.frame.origin.x
        }
    }
    
    var y:CGFloat {
        set(newY) {
            self.frame = CGRect(x: self.frame.origin.x, y: newY, width: self.frame.size.width, height: self.frame.size.height)
        }
        get {
            return self.frame.origin.y
        }
    }
    
    var width:CGFloat {
        set(newWidth) {
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: newWidth, height: self.frame.size.height)
        }
        get {
            return self.frame.size.width
        }
    }
    
    var height:CGFloat {
        set(newHeight) {
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: newHeight)
        }
        get {
            return self.frame.size.height
        }
    }
    
    var size:CGSize{
        set(newSize){
            self.frame.size = newSize
        }
        get{
            return self.frame.size
        }
    }
    
    var origin:CGPoint{
        set(newOrigin){
            self.frame.origin = newOrigin
        }
        get{
            return self.frame.origin
        }
    }
}
