//
//  ContentView.swift
//  DeviceActivityTest
//
//  Created by Jun Guo on 2022-09-13.
//

import SwiftUI
import FamilyControls

struct ContentView: View {
    let center = AuthorizationCenter.shared
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            Task {
                do {
                    try await center.requestAuthorization(for: .individual)
                    print("got the permission!")
                }catch {
                    print("failed to enroll individual with error, \(error)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
