//
//  findCtrl.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/5/10.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

class PMFindCtrl: UIViewController
{
    var webView:UIWebView?
    
    override func loadView()
    {
        super.loadView()
        self.view.backgroundColor = UIColor.blue
        self.navigationItem.title = "发现"
        
        webView = UIWebView.init(frame: CGRect(x: 0, y: 0, width: self.view.width, height: self.view.height))
        webView!.scrollView.bounces = false
        webView!.scalesPageToFit = true
        webView!.scrollView.showsHorizontalScrollIndicator = false
        webView!.scrollView.showsVerticalScrollIndicator = false
        self.view.addSubview(webView!)
        webView!.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.left.right().top().bottom().mas_equalTo()(self.view)
        })
        
//      let orginAgent = webView?.stringByEvaluatingJavaScript(from: "navigator.userAgent")
//      let dic = ["userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15"]
//      UserDefaults.standard .register(defaults: dic)
        
        let request:URLRequest = URLRequest.init(url: URL.init(string: "https://i.meituan.com/toutiao?uuid=923D14FFAE6463884811B1703339D9858FAAE85EEB6005CD1DDBA752098DCCF1&version_name=8.5.3&utm_term=8.5.3&utm_content=923D14FFAE6463884811B1703339D9858FAAE85EEB6005CD1DDBA752098DCCF1&utm_source=AppStore&userid=54967667&utm_medium=iphone&idfa=612E9FC8-85BA-4970-A547-6E78AA3CE85D&lat=30.544733&utm_campaign=AgroupBgroupD200GdiscoverH0&token=ZnmQzEdGMGAIWFQZ4HL8rbF4OKIAAAAA8AUAAH0QI5N5cqx19xpUAewjHmzVxOVH_UdGpUIZxAdHCS4tOUQY3OsPfRtKVs8fZUaVng&idfv=A1939D06-76AC-4D0F-B730-4959861529F8&regionid=&lng=114.335652&f=iphone&ci=57&msid=672BEBD3-FEBF-4A73-B6C0-BFB4B9FDEA782018-06-11-13-58927")!)
        webView?.loadRequest(request)
    }
    

}
