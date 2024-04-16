//
//  CombineSwiftUIApp.swift
//  CombineSwiftUI
//
//  Created by asmaa gamal  on 16/04/2024.
//

import SwiftUI

@main
struct CombineSwiftUIApp: App {
   
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView(taskModel: TaskListModel())
            }
        }
    }
}
