//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Data on 12.06.24.
//

import Foundation
import SimpleNetworking

final class WeatherViewModel: ObservableObject {
    // MARK: Properties
    @Published var hourly: [DailyCurrent] = []
    @Published var forecast: [Forecast.List] = []
    @Published var current: DailyCurrent?
    @Published var timeZoneOffset: Int?
    @Published var currentWeatherModel: CurrentWeather.Model?
    
    // MARK: Keys/Paths
    let baseIconUrlPath = "https://openweathermap.org/img/wn/"
    private let forecastApiKey = "690f88717c984072f681182b5be6acb1"
    private let hourlyKey = "439d4b804bc8187953eb36d2a8c26a02"
    
    // MARK: - Fetching Functions
    func fetchForecast(lat: Double, lon: Double) {
        WebService().fetchData(from: "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=\(forecastApiKey)&units=metric", resultType: Forecast.Model.self) { [weak self] data in
            switch data {
            case .success(let data):
                DispatchQueue.main.async {
                    var seenDays: Set<String> = []
                    var uniqueItems: [Forecast.List] = []
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    let outputFormatter = DateFormatter()
                    outputFormatter.dateFormat = "yyyy-MM-dd"
                    
                    for item in data.list {
                        if let date = dateFormatter.date(from: item.dtTxt) {
                            let dayString = outputFormatter.string(from: date)
                            if !seenDays.contains(dayString) {
                                seenDays.insert(dayString)
                                uniqueItems.append(item)
                            }
                        }
                    }
                    self?.forecast = uniqueItems
                }
            case .failure(let error):
                print("Error fetching page info: \(error)")
            }
        }
    }
    
    func fetchHourly(lat: Double, lon: Double) {
        WebService().fetchData(from: "https://openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&units=metric&appid=\(hourlyKey)", resultType: WeatherData.self) { [weak self] data in
            switch data {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.timeZoneOffset = data.timezoneOffset
                    self?.hourly = data.hourly ?? []
                    self?.current = data.current
                }
            case .failure(let error):
                print("Fetch failed: \(error)")
            }
        }
    }
    
    func fetchingCurrentWeather(lat: Double, lon: Double) {
        WebService().fetchData(from: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(forecastApiKey)&units=metric", resultType: CurrentWeather.Model.self) { [weak self] data in
            switch data {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.currentWeatherModel = data
                }
            case .failure(let error):
                print("Fetch current weather failed: \(error)")
            }
        }
    }
}
