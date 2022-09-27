//
//  ContentView.swift
//  app2
//
//  Created by Jun Guo on 2022-09-22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var obser: MyObservable
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("APP2")
            VStack{
                Link("Visit app1", destination: URL(string: "com.app1://main")!)
                    .font(.title)
                    .foregroundColor(.red)
                
                Link("Visit app1 with data", destination: URL(string: "com.app1://main")!)
                    .font(.title)
                    .foregroundColor(.red)
                
                
            }
            
            VStack{
                Link("Visit web app", destination: URL(string: "http://192.168.0.12:4000/?q=from_app2")!)
                    .font(.title)
                    .foregroundColor(.red)
                
                Link("Visit web app with data", destination: URL(string: "http://192.168.0.12:4000/?q=from_app2")!)
                    .font(.title)
                    .foregroundColor(.red)
            }
            
            VStack{
                Text( "from \(obser.url?.host ?? "")")
                Text(obser.url?.query ?? "query")
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
