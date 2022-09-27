//
//  ContentView.swift
//  UrlSchemeTest
//
//  Created by Jun Guo on 2022-09-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("APP1")
            
            VStack{
                Link("Visit app2", destination: URL(string: "com.app2://")!)
                    .font(.title)
                    .foregroundColor(.red)
                
                Link("Visit app2 with data", destination: URL(string: "com.app2://app1?q=123")!)
                    .font(.title)
                    .foregroundColor(.red)
            }
            
            
            VStack{
                Link("Visit web app", destination: URL(string: "http://192.168.0.12:4000/")!)
                    .font(.title)
                    .foregroundColor(.red)
              
                Link("Visit web app with data", destination: URL(string: "http://192.168.0.12:4000/?q=from_app1")!)
                    .font(.title)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
