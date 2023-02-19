//
//  slot_machine_group16App.swift
//  slot_machine_group16
//
//  Created by Yachao on 2023-01-22.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
@main
struct slot_machine_group16App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var dateManager = DataManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dateManager)
        }
    }
}
