//
//  ContentView.swift
//  CombineSwiftUI
//
//  Created by asmaa gamal  on 16/04/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var taskModel:TaskListModel
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            List{
                ForEach(taskModel.tasks.value,id:\.self){task in
                    Text(task)
                }
            }
            NavigationLink(destination: AddNewTaskView(taskModel: taskModel)){
               
                    Image(systemName: "plus")
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(taskModel: TaskListModel())
}
