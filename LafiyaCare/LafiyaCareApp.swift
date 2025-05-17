//
//  LafiyaCare_IOSApp.swift
//  LafiyaCare-IOS
//
//  Created by Khaled Mohamed Ali on 5/16/25.
//

import SwiftUI
import FirebaseCore

@main
struct LafiyaCare_IOSApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        print("Firebase Configured")
        return true
    }
}
