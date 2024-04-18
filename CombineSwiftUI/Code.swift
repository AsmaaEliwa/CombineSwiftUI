//
//  Code.swift
//  CombineSwiftUI
//
//  Created by asmaa gamal  on 18/04/2024.
//
import Combine
import Foundation
var cancellables = Set<AnyCancellable>() // we put it here to increase the life time for the cancellabes values
func run(){
    Just(15).delay(for: 1 , scheduler: DispatchQueue.main).sink { value in     //just works syncrounslly so if we added a delay the value will be gone when the function life time id done so we need to store it
        print(value)
    }.store(in: &cancellables) // now it will print the value
    
    //how to make an array a publisher
    [1,2,3,4,5,6].publisher
        .filter({$0 % 2 == 0})
        .print() // will print 2 4 6
        .map({$0 * $0 })
        .print()  //will print 4 16 36
        .sink { value  in
//            print(value)
        }.store(in: &cancellables)
}
