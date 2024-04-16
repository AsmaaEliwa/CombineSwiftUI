//
//  AddNewTaskView.swift
//  CombineSwiftUI
//
//  Created by asmaa gamal  on 16/04/2024.
//

import SwiftUI
import SwiftUI

struct AddNewTaskView: View {
    @State private var text: String = ""
    @Environment(\.presentationMode) var presentationMode
    var taskModel: TaskListModel?
    
    var body: some View {
        VStack {
            Text("New Task!")
            TextField("Enter Task Title", text: $text).padding()
            
            Button("Add") {
                taskModel?.addNewTask.send(text)
                presentationMode.wrappedValue.dismiss() // Dismiss the view
            }
            
            Button("Cancel") {
                presentationMode.wrappedValue.dismiss() // Dismiss the view
            }
        }
        .padding()
    }
}

#Preview {
    AddNewTaskView()
}
