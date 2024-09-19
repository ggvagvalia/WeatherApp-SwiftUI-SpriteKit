//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Data on 12.06.24.
//

import SwiftUI
import SwiftData

struct WeatherView: View {
    // MARK: Properties
    @EnvironmentObject var viewModel: WeatherViewModel
    @Query var selectedCities: [CityData]
    @State private var selectedCity: CityData? = nil
    @State private var showAddLocationView = false
    @State private var currentWeather: String? = nil
    
    #warning("ეს ცვლადი ბარემ ვიუმოდელში არ ჯობია? და ოფშენალსაც იქვე გაუმკლავდეს")
    private var current: CurrentWeather.Main? {
        viewModel.currentWeatherModel?.main
    }
    
    private var frameWidth: CGFloat {
        screenWidth * 0.93
    }
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            ZStack {
                if let weather = viewModel.currentWeatherModel?.weather.first?.main {
                    WeatherView.changeBackgrounds(for: weather, date: Date(timeIntervalSince1970: TimeInterval(viewModel.current?.dt ?? 0)), timeOffset: viewModel.timeZoneOffset)
                }
                
                VStack {
                    
                    CitySelectionMenu(selectedCity: $selectedCity, selectedCities: selectedCities, selectCity: selectCity)
                        .padding(.trailing, 20)
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: -3, y: 3)
                    
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 22) {
                            #warning("ამას მარტო აქ იყენებ და ცალკე საბვიუები არ უნდა, ამავე ფაილში ჯობდა გაკეთება როგორც computed property ან ფუნქციები")
                            CurrentTemperatureDetailsView(temperature: current?.formattedTemp ?? "", maxTemp: current?.formattedTempMax ?? "", minTemp: current?.formattedTempMin ?? "")
                                .frame(width: frameWidth, height: 135)
                                .font(.system(size: 18))
                                .foregroundStyle(.white)
                                .background(
                                    TransparentBlurView(removeAllFilters: true)
                                        .blur(radius: 2, opaque: true)
                                )
                            
                            CurrentDetailsHView(humidity: current?.humidity ?? 0, feelsLike: current?.formattedFeelsLike ?? "", windSpeed: viewModel.currentWeatherModel?.wind.formattedWindSpeed ?? "" )
                                .frame(width: frameWidth, height: 47)
                                .font(.system(size: 18))
                                .foregroundStyle(.white)
                                .background(
                                    TransparentBlurView(removeAllFilters: true)
                                        .blur(radius: 2, opaque: true)
                                )
                            
                            HourlyWeatherView(hourly: $viewModel.hourly, current: $viewModel.current, timeZoneOffset: $viewModel.timeZoneOffset, baseIconUrlPath: viewModel.baseIconUrlPath)
                                .background(
                                    TransparentBlurView(removeAllFilters: true)
                                        .blur(radius: 2, opaque: true)
                                )
                                .frame(width: frameWidth, height: 200)
                                .background(
                                    TransparentBlurView(removeAllFilters: true)
                                        .blur(radius: 2, opaque: true)
                                )
                            
                            DailyWeatherView(forecast: $viewModel.forecast, baseIconUrlPath: viewModel.baseIconUrlPath)
                                .background(
                                    TransparentBlurView(removeAllFilters: true)
                                        .blur(radius: 2, opaque: true)
                                )
                                .frame(width: frameWidth, height: 363)
                                .background(
                                    TransparentBlurView(removeAllFilters: true)
                                        .blur(radius: 2, opaque: true)
                                )
                        }
                    }
                }
            }
            .onAppear {
                if selectedCity == nil, let defaultCity = selectedCities.first(where: { $0.name == "Tbilisi" }) {
                    selectCity(defaultCity)
                }
            }
        }
    }
    
    // MARK: - Helper functions
    private func selectCity(_ city: CityData) {
        selectedCity = city
        viewModel.fetchingCurrentWeather(lat: city.latitude, lon: city.longitude)
        viewModel.fetchForecast(lat: city.latitude, lon: city.longitude)
        viewModel.fetchHourly(lat: city.latitude, lon: city.longitude)
    }
    
    static func changeBackgrounds(for weather: String, date: Date, timeOffset: Int?) -> AnyView {
        let time = DateFormater.formatTime(date: date, timezoneOffset: timeOffset)
        let isNightTime = DateFormater.isNightTime(timeString: time)
        
        switch weather {
        case "Clouds":
            return isNightTime ? AnyView(CloudyNightView()) : AnyView(CloudyView())
        case "Clear":
            return isNightTime ? AnyView(WarmNightView()) : AnyView(SunnyView())
        case "Snow":
            return isNightTime ? AnyView(SnowyNightView()) : AnyView(SnowyView())
        case "Rain":
            return isNightTime ? AnyView(RainyNightView()) : AnyView(RainyView())
        case "Drizzle":
            return isNightTime ? AnyView(RainyNightView()) : AnyView(RainyView())
        case "Thunderstorm":
            return isNightTime ? AnyView(RainyNightView()) : AnyView(RainyView())
        default:
            return isNightTime ? AnyView(WarmNightView()) : AnyView(SunnyView())
        }
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherViewModel())
}
