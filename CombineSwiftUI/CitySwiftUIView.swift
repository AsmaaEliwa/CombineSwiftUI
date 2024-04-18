//
//  CitySwiftUIView.swift
//  CombineSwiftUI
//
//  Created by asmaa gamal  on 18/04/2024.
//

import SwiftUI

struct CitySwiftUIView: View {
    @ObservedObject var cityViewModel :CityViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            List{
                ForEach(cityViewModel.cities , id:\.self){city in
                    Text(city.city)
                }
            }
        }.searchable(text: $cityViewModel.text)
    }
}

#Preview {
    CitySwiftUIView(cityViewModel: CityViewModel())
}
