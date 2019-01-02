//
//  AppDelegate.swift
//  HelloWorld
//
//  Created by 이동영 on 01/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit


//=========================================================
//     UIApplication 에 AppDelegation이라고 알리는 에노테이션
//=========================================================
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    /*******************************************
            앱로딩되고 실행완료 직전에 실행되는 메소드
     *******************************************/
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        // Override point for customization after application launch.
        
        //==================
        //  추가한 실행화면
        // 보기 위해서 스레드 지연
        //==================
        sleep(1)
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

    /****************************************************
    *
    *       앱  종료 직전에 실행되는 메소드
    *     데이터를 서버에 전송 저장 이런걸 적용하는 듯하다.
    ******************************************************/
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

