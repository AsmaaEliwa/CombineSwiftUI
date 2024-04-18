//
//  CityViewModel.swift
//  CombineSwiftUI
//
//  Created by asmaa gamal  on 18/04/2024.
//

import Foundation
import Combine
class CityViewModel:ObservableObject{
    @Published var allcities: [City] = []
    @Published var text :String = ""
    @Published var searchResult:[City] = []
    var cities: [City]  {
        if text.isEmpty {
            return allcities
        }else{
            return allcities.filter { $0.city.contains(text) }
        }
    }
    
    var cancelapels = Set<AnyCancellable>()
    init(){
        fetchCities().sink { compilation in
            print(compilation)
        } receiveValue: {[weak self] value in
            print(value)
            self?.allcities = value
        }.store(in: &cancelapels)
        
//        self.searchResult = Allcities.filter({$0.city == text})
        

    }
}

