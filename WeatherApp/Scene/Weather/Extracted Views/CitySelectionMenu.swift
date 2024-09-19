//
//  CitySelectionMenu.swift
//  WeatherApp
//
//  Created by Luka Gujejiani on 12.06.24.
//

import SwiftUI

struct CitySelectionMenu: View {
    // MARK: - Properties
    @Binding var selectedCity: CityData?
    var selectedCities: [CityData]
    var selectCity: (CityData) -> Void
    
    // MARK: - Views
    var body: some View {
        HStack {
            Spacer()
            
            Menu {
                ForEach(selectedCities) { city in
                    Button(action: {
                        selectCity(city)
                    }) {
                        Text(city.name)
                        if selectedCity?.name == city.name {
                            Image(systemName: "checkmark")
                        }
                    }
                }
                NavigationLink(destination: SearchView()) {
                    Label("Add New Location", systemImage: "plus")
                }
            } label: {
                HStack {
                    Image("Location")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.leading, 8)
                    
                    Text(selectedCity?.name ?? "Select City")
                    
                    Image(systemName: "chevron.down")
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 8)
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color(hex: "#5882C1").opacity(0.3))
                        .clipShape(
                            .rect(
                                topLeadingRadius: 20,
                                bottomLeadingRadius: 20,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 0
                            )
                        )
                        .frame(height: 40)
                )
            }
        }
        .padding(.trailing, -18)
        .padding(.bottom, 40)
    }
}
