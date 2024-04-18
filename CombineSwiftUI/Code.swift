//
//  Code.swift
//  CombineSwiftUI
//
//  Created by asmaa gamal  on 18/04/2024.
//
import Combine
import Foundation
var cancellables = Set<AnyCancellable>()
func run(){
    Just(15).delay(for: 1 , scheduler: DispatchQueue.main).sink { value in     //just works syncrounslly so if we added a delay the value will be gone when the function life time id done so we need to store it
        print(value)
    }.store(in: &cancellables) // now it will print the value 
}
