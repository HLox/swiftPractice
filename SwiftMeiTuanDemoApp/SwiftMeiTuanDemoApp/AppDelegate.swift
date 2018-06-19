//
//  AppDelegate.swift
//  SwiftMeiTuanDemoApp
//
//  Created by liupm on 2018/5/7.
//  Copyright © 2018年 liupm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var my: PMMyCtrl?
    var order:PMOrderCtrl?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        application.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: false)

        window = UIWindow.init(frame:UIScreen.main.bounds)
        
        let index:PMIndexCtrl = PMIndexCtrl.init()
        let indexNav:UINavigationController = UINavigationController.init(rootViewController: index)
        indexNav.tabBarItem.title = "首页"
        indexNav.tabBarItem.image = UIImage.init(imageLiteralResourceName: "pfb_tabbar_homepage")
        indexNav.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: "pfb_tabbar_homepage_selected")

        let near:NearByCtrl = NearByCtrl.init()
        near.tabBarItem.title = "附近"
        near.tabBarItem.image = UIImage.init(imageLiteralResourceName: "pfb_tabbar_merchant")
        near.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: "pfb_tabbar_merchant_selected")

        let find:PMFindCtrl = PMFindCtrl.init()
        let findNav:UINavigationController = UINavigationController.init(rootViewController: find)
        findNav.tabBarItem.title = "发现"
        findNav.tabBarItem.image = UIImage.init(imageLiteralResourceName: "pfb_tabbar_discover")
        findNav.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: "pfb_tabbar_discover_selected")
        findNav.navigationBar.isTranslucent = false
        
//        let order:OrderCtrl = OrderCtrl.init()
        order = PMOrderCtrl.init()
        order?.tabBarItem.title = "订单"
        order!.tabBarItem.image = UIImage.init(imageLiteralResourceName: "pfb_tabbar_order")
        order!.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: "pfb_tabbar_order_selected")

//        let my:MyCtrl = MyCtrl.init()
        my = PMMyCtrl.init()
        my?.tabBarItem.title = "我的"
        my!.tabBarItem.image = UIImage.init(imageLiteralResourceName: "pfb_tabbar_mine")
        my!.tabBarItem.selectedImage = UIImage(imageLiteralResourceName: "pfb_tabbar_mine_selected")

        let tabbarCtrl:UITabBarController = UITabBarController.init()
        tabbarCtrl.tabBar.isTranslucent = false
        tabbarCtrl.viewControllers = [indexNav,near,findNav,order!,my!]
        tabbarCtrl.tabBar.tintColor = UIColor(hexStr: "20C3AD")
        tabbarCtrl.tabBar.backgroundImage = UIImage(imageLiteralResourceName: "pfb_tabbar_background")
        
        window?.rootViewController = tabbarCtrl
        window?.makeKeyAndVisible();

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

