//
//  Forecast.swift
//  WeatherApp
//
//  Created by Data on 12.06.24.
//

import Foundation

class Forecast {
    struct Model: Decodable {
        let cod: String
        let list: [List]
        let city: City
    }
    
    struct City: Decodable {
        let id: Int
        let coord: Coord
        let country: String
    }
    
    struct Coord: Decodable {
        let lat, lon: Double
    }
    
    struct List: Decodable {
        let dt: Int
        let main: MainClass
        let weather: [Weather]
        let dtTxt: String
        
        enum CodingKeys: String, CodingKey {
            case dt, main, weather
            case dtTxt = "dt_txt"
        }
    }
    
    struct MainClass: Decodable {
        let temp, tempMin, tempMax: Double
        
        enum CodingKeys: String, CodingKey {
            case temp
            case tempMin = "temp_min"
            case tempMax = "temp_max"
        }
    }
    
    struct Weather: Decodable {
        let id: Int
        let main: MainEnum
        let icon: String
    }
    
    enum MainEnum: String, Decodable {
        case clear = "Clear"
        case clouds = "Clouds"
        case rain = "Rain"
    }
}
