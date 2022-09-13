//
//  ContentView.swift
//  HackNews
//
//  Created by Jun Guo on 2022-09-13.
//

import SwiftUI

struct ContentView: View {
    
    let list = ["jun", "yan"]
    
    var body: some View {
        NavigationView {
            
            List(posts){ post in
                Text(post.title)
            }
            
            .navigationTitle("Hello")
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



let posts = [
    Post(id: "1", title: "Jun"),
    Post(id: "2", title: "Yan")
]
