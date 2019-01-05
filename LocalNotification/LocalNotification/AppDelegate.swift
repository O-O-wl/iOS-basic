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
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {

    var window: UIWindow?

    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /************************************************
        *
        *   초기 뱃지,알림창,사운드 사용자 확인여부 인증부
        *
        *************************************************/
        let center = UNUserNotificationCenter.current()
        
        // 앱델리케이트클래스에게 notificationCenter기능 위임
       
        center.requestAuthorization(options: [.alert,.badge,.sound], completionHandler: {(didAllow,e) in })
        center.delegate = self
        
        return true
    }

    
    /**#########################################################
    *
    *            앱 라이프사이클에서 백그라운드 상태 진입시 실행
    *
     ########################################################**/
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
        
    /**================================ 구분선==================================***/
        
        //=================================================
        //
        //   센터 객체를 가져와서 초기 알림허용 상태 확인 if
        //=================================================
        UNUserNotificationCenter.current().getNotificationSettings{settings in if(settings.authorizationStatus == UNAuthorizationStatus.authorized){
            
        /******************************
        *           컨텐츠 셋팅부
        *******************************/
            
        let contents = UNMutableNotificationContent()
        contents.title = "알림 타이틀"
            contents.subtitle = "알림 서브타이틀 : 누르면 앱 실행해여~"
        contents.body = "여기는 엄청 길게 글을 맘대로 늘어뜨려 쓸수 있고 이것 저것 다 쓸 수 있는 이곳은 바로 바디"
        contents.sound = UNNotificationSound.default
        contents.badge = 1
        contents.userInfo=["name":"이동영"]
            
            
        //=======================
        //      시간 셋팅부
        //=======================
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            
        /*********************************
        *
        *      트리거와 컨턴츠로 요청객체생성
        *
        **********************************/
        let request = UNNotificationRequest(identifier: "wakeUp", content: contents, trigger: trigger)
        //=====================================================
        //
        // center 에 request 등록  --- IoC개념으로 알아서 시스템이 실행함
        //
        //====================================================
        UNUserNotificationCenter.current().add(request)
            }}
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
     
            print("\( notification.request.content.userInfo["name"]!)님 어서 오세요 ! ")
        
       
        
        completionHandler([.alert,.sound,.badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let storyboard = UIStoryboard(name:"Main", bundle: Bundle.main)
        let VC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        VC!.lab = "\(response.notification.request.content.userInfo["name"]!)님 안녕하세요 ! "
        
        VC?.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        
        completionHandler()
          //  self.present(VC!, animated: true )
        }
        
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




