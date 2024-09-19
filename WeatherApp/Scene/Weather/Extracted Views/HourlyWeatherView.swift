//
//  HourlyWeatherView.swift
//  WeatherApp
//
//  Created by Bakar Kharabadze on 6/12/24.
//

import SwiftUI

struct HourlyWeatherView: View {
    // MARK: - Properties
    @State private var selectedTime: Int? = nil
    
    @Binding var hourly: [DailyCurrent]
    @Binding var current: DailyCurrent?
    @Binding var timeZoneOffset: Int?
    
    private let baseIconUrlPath: String
    
    public init(hourly: Binding<[DailyCurrent]>, current: Binding<DailyCurrent?>, timeZoneOffset: Binding<Int?>, baseIconUrlPath: String) {
        self._hourly = hourly
        self._current = current
        self._timeZoneOffset = timeZoneOffset
        self.baseIconUrlPath = baseIconUrlPath
    }
    
    // MARK: - View
    var body: some View {
        VStack {
            HStack {
                Text("Today")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: -3, y: 3)
                    .padding(.leading, 17)
                
                Spacer()
                
                Text(DateFormater.formatDate(date: Date(timeIntervalSince1970: TimeInterval(current?.dt ?? 0))))
                    .foregroundColor(.white)
                    .font(.custom("SF Pro Display", size: 18))
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: -2, y: 3)
                    .padding(.trailing, 20)
            }
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    ForEach(hourly.prefix(24), id: \.dt) { weather in
                        HourlyWeatherItemView(
                            weather: weather,
                            baseIconUrlPath: baseIconUrlPath,
                            timeZoneOffset: timeZoneOffset,
                            isSelected: selectedTime == weather.dt,
                            onTap: {
                                if selectedTime == weather.dt {
                                    selectedTime = nil
                                } else {
                                    selectedTime = weather.dt
                                }
                            }
                        )
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 12)
        }
        .background(
            Color(hex: "5882C1").opacity(0.3)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
        )
    }
}

struct HourlyWeatherItemView: View {
    // MARK: - Properties
    let weather: DailyCurrent
    let baseIconUrlPath: String
    let timeZoneOffset: Int?
    let isSelected: Bool
    let onTap: () -> Void
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Text("\(Int(weather.temp ?? 10))°C")
                .foregroundColor(.white)
                .font(.custom("SF Pro Display", size: 16))
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: -2, y: 3)
            
            if let icon = weather.weather?.first?.icon {
                let iconUrl = baseIconUrlPath + "\(icon).png"
                AsyncImage(url: URL(string: iconUrl)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                } placeholder: {
                    ProgressView()
                }
            }
            
            Text(DateFormater.formatTime(date: Date(timeIntervalSince1970: TimeInterval(weather.dt ?? 0)), timezoneOffset: timeZoneOffset))
                .foregroundColor(.white)
                .font(.custom("SF Pro Display", size: 14))
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: -2, y: 3)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(isSelected ? Color("TapColor") : Color.clear)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: isSelected ? 1 : 0)
        )
        .onTapGesture {
            onTap()
        }
    }
}
