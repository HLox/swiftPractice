//
//  nearByCtrl.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/5/10.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

extension NSURLRequest
{
    open class func allowsAnyHTTPSCertificateForHost(_ host:NSString) -> Bool
    {
        return true
    }
}


class NearByCtrl: UIViewController,UIWebViewDelegate
{
    var webView:UIWebView?
    
    override func loadView()
    {
        super.loadView()
        self.view.backgroundColor = UIColor.blue
        
        webView = UIWebView.init(frame: CGRect(x: 0, y: 0, width: self.view.width, height: self.view.height))
        
//        let orginAgent = webView?.stringByEvaluatingJavaScript(from: "navigator.userAgent")
        let dic = ["userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15"]
        UserDefaults.standard .register(defaults: dic)
        
        let request:URLRequest = URLRequest.init(url: URL.init(string: "https://i.meituan.com/")!)
        webView?.delegate = self
        webView?.loadRequest(request)
        
        self.view.addSubview(webView!)
        
    }
    
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        
    }
    
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
//        print("--------\(error)")
        NSLog("%@", error.localizedDescription)
    }
    
}
