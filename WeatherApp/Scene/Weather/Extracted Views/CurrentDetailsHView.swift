//
//  CurrentDetailsHView.swift
//  WeatherApp
//
//  Created by Luka Gujejiani on 13.06.24.
//

import SwiftUI

struct CurrentDetailsHView: View {
    // MARK: - Properties
    let humidity: Int
    let feelsLike: String
    let windSpeed: String
    
    // MARK: - View
    var body: some View {
        ZStack {
            Color(hex: "5882C1").opacity(0.3)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
            
            HStack(spacing: 15) {
                
                HStack {
                    Image("HumimdityIcon")
                    Text("\(humidity)%")
                }
                
                Spacer()
                
                HStack {
                    Image("TemperatureIcon")
                    Text("\(feelsLike)º")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                HStack {
                    Image("WindIcon")
                    Text("\(windSpeed) Km/h")
                }
            }
            .font(.system(size: 14))
            .padding(.horizontal, 30)
            .bold()
            
        }
        .foregroundStyle(.white)
    }
}
