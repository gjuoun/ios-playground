//
//  ContentView.swift
//  HackNews
//
//  Created by Jun Guo on 2022-09-13.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationView {
            
            List(networkManager.posts){ post in
                NavigationLink( ){
                    
                }
                Item(post: post)
            }.onAppear{
                networkManager.fetchData()
            }
            
            .navigationTitle("Hello")
        }

        
    }
}

struct Item: View {
    let post: Post
    var body: some View {
        HStack{
            Text(String(post.points)).padding(.horizontal, 5)
            Text(post.title)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


