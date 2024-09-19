//
//  CurrentWeatherModel.swift
//  WeatherApp
//
//  Created by Data on 12.06.24.
//

import Foundation

#warning("ოხ ეს ლუკას ჩანესტილი ამბები")
final class CurrentWeather: Decodable {
    struct Model: Decodable {
        let weather: [Weather]
        let main: Main
        let wind: Wind
    }
    
    struct Main: Decodable {
        let temp, feelsLike, tempMin, tempMax: Double
        let humidity: Int
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case humidity
        }
    }
    
    struct Weather: Decodable {
        let main: String
    }
    
    struct Wind: Decodable {
        let speed: Double
    }
}
