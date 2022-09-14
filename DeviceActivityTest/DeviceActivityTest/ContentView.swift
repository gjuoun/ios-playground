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
    
    @State var selection = FamilyActivitySelection()
    @State private var isDiscouragedPresented = false
    @State private var isEncouragedPresented = false
    
    @EnvironmentObject var model: MyModel
    
    var body: some View {
        VStack {
            Button("Select Apps to Discourage") {
                isDiscouragedPresented = true
            }
            .familyActivityPicker(isPresented: $isDiscouragedPresented, selection: $model.selectionToDiscourage)
            .onChange(of: model.selectionToDiscourage) { newSelection in
                print(newSelection)
                
            }
            
            Button("Select Apps to Encourage") {
                isEncouragedPresented = true
            }
            .familyActivityPicker(isPresented: $isEncouragedPresented, selection: $model.selectionToEncourage)
            .onChange(of: model.selectionToEncourage) { newSelection in
                print(newSelection)
                MySchedule.setSchedule()
            }
        }
        .onChange(of: model.selectionToDiscourage) { newSelection in
            MyModel.shared.setShieldRestrictions()
        }
        .padding()
        .onAppear{
            print("loaded")
//            Task {
//                do {
//                    try await center.requestAuthorization(for: .individual)
//                    print("got the permission!")
//                }catch {
//                    print("failed to enroll individual with error, \(error)")
//                }
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
