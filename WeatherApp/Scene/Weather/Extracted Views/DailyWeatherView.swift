//
//  DailyWeatherView.swift
//  WeatherApp
//
//  Created by Bakar Kharabadze on 6/12/24.
//

import SwiftUI

struct DailyWeatherView: View {
    // MARK: - Properties
    @Binding var forecast: [Forecast.List]
    private let baseIconUrlPath: String
    
    public init(forecast: Binding<[Forecast.List]>, baseIconUrlPath: String) {
        self._forecast = forecast
        self.baseIconUrlPath = baseIconUrlPath
    }
    
    // MARK: - View
    var body: some View {
        VStack {
            ZStack {
                Color(hex: "5882C1").opacity(0.3)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
                
                    .overlay(
                        ScrollView {
                            VStack(spacing: 0) {
                                ForEach(forecast, id: \.dt) { weather in
                                    HStack {
                                        VStack(alignment: .leading) {
                                            
                                            Text(DateFormater.formatDay(dateString: weather.dtTxt))
                                            //                                                .foregroundColor(.white)
                                                .font(.custom("Alegreya Sans", size: 18))
                                                .font(.headline)
                                        }
                                        .frame(width: 100, alignment: .leading)
                                        
                                        Spacer()
                                        
                                        if let icon = weather.weather.first?.icon {
                                            let iconUrl = baseIconUrlPath + "\(icon).png"
                                            AsyncImage(url: URL(string: iconUrl)) { image in
                                                image.resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 40, height: 40)
                                            } placeholder: {
                                                ProgressView()
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        DailyWeatherHView(tempMax: weather.main.tempMax, tempMin: weather.main.tempMin)
                                        
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .cornerRadius(8)
                                }
                            }
                            .foregroundColor(.white)
                            .padding(.top)
                        }
                    )
            }
        }
    }
}

private struct DailyWeatherHView: View {
    let tempMax: Double
    let tempMin: Double
    
    var body: some View {
        HStack(spacing: 8) {
            Text("\(Int(tempMax))")
                .font(.custom("Alegreya Sans", size: 18))
            //                .foregroundColor(.white)
            
            Text("°C")
                .font(.custom("Alegreya Sans", size: 10))
            //                .foregroundColor(.white)
                .padding(.leading, -8)
            
            Text("\(Int(tempMin))")
                .foregroundColor(Color.white.opacity(0.7))
                .font(.custom("Alegreya Sans", size: 18))
            
            Text("°C")
                .foregroundColor(Color.white.opacity(0.7))
                .font(.custom("Alegreya Sans", size: 10))
                .padding(.leading, -8)
        }
        .frame(width: 80)
    }
}
