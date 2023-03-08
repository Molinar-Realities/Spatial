//
//  MolinarApp.swift
//  Molinar
//
//  Created by Matt Molinar on 2/24/23.
//

import SwiftUI
import FirebaseCore
import UserNotifications


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        // Request permission for local notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                // Handle the error
                print("Error requesting permission for notifications: \(error.localizedDescription)")
            } else if granted {
                // Authorization granted
                print("Permission granted for notifications")
            } else {
                // Authorization denied
                print("Permission denied for notifications")
            }
        }
        
        return true
    }
}

@main
struct MolinarApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var locationViewModel = LocationSearchViewModel()
    @StateObject var taskViewModel = TasksViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(AuthViewModel.shared)
                .environmentObject(BottomSheetViewModel.shared)
                .environmentObject(locationViewModel)
                .environmentObject(taskViewModel)

        }
    }
}
