//
//  App243App.swift
//  App243
//
//  Created by Вячеслав on 11/3/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Alamofire
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_eq2CVV3mU1fPpU4VHCoRfnd4LK6fvu")
        
        notificationsGetStarted()
        
        OneSignal.initialize("bcd05464-9eee-4114-93d6-38da44334f88", withLaunchOptions: launchOptions)
        Amplitude.instance().initializeApiKey("29deebebe64e45d37271745f99dd039c")
        
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().setUserId(Apphud.userID())
        OneSignal.login(Apphud.userID())
        
        FirebaseApp.configure()
        
        return true
    }
}

func notificationsGetStarted() {
    
    let url = "https://onesignal-ba.com/api/os/Infwjkqo422EM7Tss0hd/\(Apphud.userID())"
    
    let request = AF.request(url, method: .get)
    
    request.response { response in
                       
        switch response.result {
            
        case .success(_):
            
            print("ok")
            
        case .failure(_):
            
            print("failure")
        }
    }
}

@main
struct App243App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
