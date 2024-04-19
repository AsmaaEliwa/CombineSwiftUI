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
    
    
    let publisher = PassthroughSubject<String,Never>()
    publisher.debounce(for: 0.5, scheduler: DispatchQueue.main)
       .sink{value in
           print(value)
       }.store(in: &cancellables)
   
   publisher.send("A")
   publisher.send("B")
   publisher.send("C")  // will only print C
    
    
    let publisherStr = PassthroughSubject<String,Never>()
    let publisherInt = PassthroughSubject<Int,Never>()

    publisherStr.zip(publisherInt).sink { value in
        print(value)   // should print ("A",1 ) ("B",2 ) ("C",3 )
    }.store(in: &cancellables)
    
    publisherStr.send("One")
    publisherInt.send(1)
    publisherStr.send("Two")
    publisherInt.send(2)
    publisherStr.send("Three")
    publisherInt.send(3)
    
    
    
    let evenPublisher = [2,4,6,8,10].publisher
    let oddPublisher = [1,3,5,7].publisher
    Publishers.CombineLatest(evenPublisher, oddPublisher).sink(receiveValue: {even,odd in
        print(even,odd)        //10 1   10 3   10 5     10 7

    }).store(in: &cancellables)
    
    Publishers.Zip(evenPublisher,oddPublisher).sink { even ,odd  in
        print(odd, even)   // 1 2     3 4   5 6   7 8
    }.store(in: &cancellables)
    
  
    
}
