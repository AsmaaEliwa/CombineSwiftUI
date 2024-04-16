//
//  TaskListModel.swift
//  CombineSwiftUI
//
//  Created by asmaa gamal  on 16/04/2024.
//

import Foundation
import Combine
import Foundation
class TaskListModel:ObservableObject{
    var tasks = CurrentValueSubject<[String],Never>(["buy Milk"])
    let addNewTask = PassthroughSubject<String , Never>()
    var subscriptions = Set<AnyCancellable>()
    init(){
        addNewTask.filter({$0.count > 3}).sink{_ in } receiveValue: {[unowned self] value in
            
            self.tasks.send(self.tasks.value + [value] )
        }
        .store(in: &subscriptions)
        tasks.sink{[unowned self] value in
            print(value)
            self.objectWillChange.send()
        }.store(in: &subscriptions)
    }
   
}
