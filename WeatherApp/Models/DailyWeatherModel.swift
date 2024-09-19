//
//  NewModel.swift
//  WeatherApp
//
//  Created by Bakar Kharabadze on 6/12/24.
//

import Foundation

struct WeatherData: Decodable {
    let lat: Double?
    let lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let current: DailyCurrent?
    let hourly: [DailyCurrent]?
    let daily: [Daily]?
    
    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, hourly, daily
    }
}

struct DailyCurrent: Decodable {
    let dt: Int?
    let temp: Double?
    let weather: [DailyWeather]?
    
    enum CodingKeys: String, CodingKey {
        case dt, temp
        case weather
    }
}

struct DailyWeather: Decodable {
    let id: Int?
    let main, icon: String?
}

struct Daily: Decodable {
    let dt: Int?
    let temp: Temp?
    let weather: [DailyWeather]?
    
    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case weather
    }
}

struct Temp: Decodable {
    let min, max: Double?
}
