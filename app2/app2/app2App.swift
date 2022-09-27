//
//  app2App.swift
//  app2
//
//  Created by Jun Guo on 2022-09-22.
//

import SwiftUI

class MyObservable: ObservableObject {
    static let shared = MyObservable()
    @Published var appId = "good message"
    @Published var url: URL?
    
    func updateAppId(appId: String){
        self.appId = appId
    }
    
    func updateUrl(url: URL){
        self.url = url
    }
}


@main
struct app2App: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var obser = MyObservable.shared
    @Environment(\.scenePhase) private var scenePhase
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(obser)
                .onOpenURL{ (url) in
                    obser.updateUrl(url: url)
                    print(url.scheme ?? "")
                }
                
        }.onChange(of: scenePhase){ newScenePhase in
         
            print(newScenePhase)
        }
    }
}


//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication,
//                     open url: URL,
//                     options: [UIApplication.OpenURLOptionsKey : Any] = [:] ) -> Bool {
//
//        let sendingAppID = options[.sourceApplication]
//            print("source application = \(sendingAppID ?? "Unknown")")
//            print("received url: \(url.absoluteString)")
//
//            // Process the URL.
////            guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
////
////                let albumPath = components.path,
////                let params = components.queryItems else {
////                    print("Invalid URL or album path missing")
////                    return false
////            }
////
////            if let photoIndex = params.first(where: { $0.name == "index" })?.value {
////                print("albumPath = \(albumPath)")
////                print("photoIndex = \(photoIndex)")
////                return true
////            } else {
////                print("Photo index missing")
////                return false
////            }
////        MyObservable.shared.updateAppId(appId: String(sendingAppID!))
//        MyObservable.shared.updateUrl(url: url.absoluteString)
//
//        return true
//    }
//}
