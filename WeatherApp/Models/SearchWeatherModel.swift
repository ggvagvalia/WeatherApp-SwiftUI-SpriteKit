//
//  SearchWeatherModel.swift
//  WeatherApp
//
//  Created by Luka Gujejiani on 12.06.24.
//

import Foundation

final class SearchWeatherModel {
    struct Model: Decodable {
        let weather: [Weather]
        let main: Main
    }
    
    struct Main: Decodable {
        let temp: Double
    }
    
    struct Weather: Decodable {
        let main: String
    }
}
