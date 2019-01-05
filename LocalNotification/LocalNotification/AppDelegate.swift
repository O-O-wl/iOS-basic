//
//  AppDelegate.swift
//  LocalNotification
//
//  Created by 이동영 on 05/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.badge,.sound], completionHandler: {(didAllow,e) in })
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        UNUserNotificationCenter.current().getNotificationSettings{settings in if(settings.authorizationStatus == UNAuthorizationStatus.authorized){        /** 컨텐츠 셋팅부  **/
        let contents = UNMutableNotificationContent()
        contents.title = "타이틀"
        contents.subtitle = "서브타이틀"
        contents.body = "여기는 엄청 길게 글을 맘대로 늘어뜨려 쓸수 있고 이것 저것 다 쓸 수 있는 이곳은 바로 바디"
        contents.sound = UNNotificationSound.default
        contents.badge = 1
        
        // 시간 셋팅부
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "init", content: contents, trigger: trigger)
        
        // center 에 request 등록  --- IoC개념으로 알아서 시스템이 실행함
        UNUserNotificationCenter.current().add(request)
            }}
        
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

