//
//  PMLoopScrollView.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/6/13.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

class PMLoopScrollViewItem:NSObject
{
    var index:NSInteger?
    var imageUrl:String?
    var userInfo:Dictionary<String, Any>?
}


class PMLoopScrollView:UIView,UIScrollViewDelegate
{
    var scrollView:UIScrollView?
    var dataSource:Array<PMLoopScrollViewItem>?
    var pageControl:UIPageControl?

    
    convenience init(_ frame:CGRect,_ datas:Array<PMLoopScrollViewItem>?)
    {
        self.init(frame: frame)
        
        scrollView = UIScrollView.init(frame: self.bounds)
        scrollView!.delegate = self
        scrollView?.isPagingEnabled = true
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView!.bounces = false
        
        self.addSubview(scrollView!)
        
        pageControl = UIPageControl.init(frame: CGRect(x: 0.0, y: scrollView!.height-30.0, width: scrollView!.width, height: 30.0))
        pageControl?.pageIndicatorTintColor = UIColor.red
        self.addSubview(pageControl!)
        
        if let count = datas?.count {
            pageControl?.numberOfPages = count
            pageControl?.currentPage = 0
            
            dataSource = datas;
            scrollView?.contentSize = CGSize(width: CGFloat(count+2)*frame.size.width, height: frame.size.height)
            
            let lastItem = dataSource?.last
            let firstImageView = UIImageView.init(frame: CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height))
            firstImageView.contentMode = UIViewContentMode.scaleAspectFill
            firstImageView.clipsToBounds = true
            firstImageView.image = UIImage.init(named: (lastItem?.imageUrl)!)
            scrollView?.addSubview(firstImageView)
            
            for i in 1...count {
                let imageFrame = CGRect(x: frame.size.width*CGFloat(i), y: 0.0, width: frame.size.width, height: frame.size.height)
                let imageView = UIImageView.init(frame: imageFrame)
                imageView.contentMode = UIViewContentMode.scaleAspectFill
                imageView.clipsToBounds = true
                let item = dataSource![i-1]
                imageView.image = UIImage.init(named: item.imageUrl!)
                scrollView?.addSubview(imageView)
            }
            
            let firstItem = dataSource?.first
            let lastImageView = UIImageView.init(frame: CGRect(x: frame.size.width*CGFloat(count+1), y: 0.0, width: frame.size.width, height: frame.size.height))
            lastImageView.image = UIImage.init(named: (firstItem?.imageUrl)!)
            lastImageView.contentMode = UIViewContentMode.scaleAspectFill
            lastImageView.clipsToBounds = true
            scrollView?.addSubview(lastImageView)
        
            let firstRect = CGRect(x: frame.size.width, y: 0.0, width: frame.size.width, height: frame.size.height)
            scrollView!.scrollRectToVisible(firstRect, animated: false);
        }
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(doLoop), userInfo: nil, repeats: true)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        let count = (dataSource?.count)!
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        if index == 0 {
            let lastRect = CGRect(x: frame.size.width*CGFloat(count), y: 0.0, width: frame.size.width, height: frame.size.height)
            scrollView.scrollRectToVisible(lastRect, animated: false);
            pageControl?.currentPage = count-1
        }else if index == count+1{
            let firstRect = CGRect(x: frame.size.width, y: 0.0, width: frame.size.width, height: frame.size.height)
            scrollView.scrollRectToVisible(firstRect, animated: false);
            pageControl?.currentPage = 0
        }else{
            pageControl?.currentPage = index-1
        }
    }
    
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView)
    {
        self.scrollViewDidEndDecelerating(scrollView)
    }
    
    
    @objc func doLoop()
    {
        let index = Int(scrollView!.contentOffset.x / scrollView!.width)+1
        let toRect = CGRect(x: frame.size.width*CGFloat(index), y: 0.0, width: frame.size.width, height: frame.size.height)
        scrollView!.scrollRectToVisible(toRect, animated: true);
    }
    
}
