//
//  DeviceActivityTestApp.swift
//  DeviceActivityTest
//
//  Created by Jun Guo on 2022-09-13.
//

import SwiftUI
import FamilyControls
import ManagedSettings

@main
struct DeviceActivityTestApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    @StateObject var model = MyModel.shared
    @StateObject var store = ManagedSettingsStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .environmentObject(store)
        }
    }
}

// 1b. The first thing Homework needs to do is request authorization for Family Controls
class AppDelegate: NSObject, UIApplicationDelegate {
    // Make this request when the app launches
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Calling this function will require a guardian in the family to approve Family Controls for Homework
        // This will prompt with an alert the first time the app launches
        // If a guardian has already approved Family Controls, it will silently return success
        // To prevent misuse, requestAuthorization will return failure if the signed-in iCloud is not a child using Family Sharing
  
        let center = AuthorizationCenter.shared
        Task {
            do {
                try await center.requestAuthorization(for: .individual)
                print("got the permission!")
//                MySchedule.setSchedule()
                
                
            }catch {
                print("failed to enroll individual with error, \(error)")
              
            }
        }
            // Once authorized:
            // The child can no longer sign out of iCloud
            // The child cannot uninstall the Homework app
            // On-device web content filters (built with the Network Extensions framework) can be included in your app and will be installed automaticaly and cannot be removed
            
            // 2a See MyMonitor.swift
            // 2b From the main app, I need to create a Device Activity name and a Device Activity schedule
        return true
        }
    }
