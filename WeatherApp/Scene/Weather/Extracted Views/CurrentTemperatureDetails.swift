//
//  Current Temperature Details.swift
//  WeatherApp
//
//  Created by Luka Gujejiani on 13.06.24.
//

import SwiftUI

struct CurrentTemperatureDetailsView: View {
    // MARK: - Properties
    let temperature: String
    let maxTemp: String
    let minTemp: String
    
    // MARK: - Views
    var body: some View {
        ZStack {
            Color(hex: "5882C1").opacity(0.3)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
            
            VStack {
                
                Text("\(temperature)º")
                    .font(.system(size: 64))
                    .bold()
                
                Text("Precipitations")
                
                HStack(spacing: 15) {
                    Text("Max.: \(maxTemp)º")
                    Text("Min.: \(minTemp)º")
                }
            }
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: -3, y: 3)
        }
    }
}
