//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jun Guo on 2022-09-19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                Color.red
                Color.blue
            }
            Text("hey Jun")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }.ignoresSafeArea()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
