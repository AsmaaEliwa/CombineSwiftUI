//
//  Network.swift
//  CombineSwiftUI
//
//  Created by asmaa gamal  on 18/04/2024.
//
import Combine
import Foundation

    func fetchCities()->AnyPublisher<[City] , Error>{
         let url = URL(string:"https://raw-tutorial.s3.eu-west-1.amazonaws.com/patients.json")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data).decode(type: [City].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
 
