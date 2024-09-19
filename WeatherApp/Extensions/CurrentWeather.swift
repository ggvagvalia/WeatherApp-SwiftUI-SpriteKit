//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Data on 14.06.24.
//

import Foundation

extension CurrentWeather.Main {
    var formattedTemp: String {
        return doubleInInt(temp)
    }
    
    var formattedTempMax: String {
        return doubleInInt(tempMax)
    }
    
    var formattedTempMin: String {
        return doubleInInt(tempMin)
    }
    
    var formattedFeelsLike: String {
        return doubleInInt(feelsLike)
    }
}

extension CurrentWeather.Wind {
    var formattedWindSpeed: String {
        let speedKmh = speed * 3.6
        let roundedSpeed = Int(speedKmh.rounded())
        return String(roundedSpeed)
    }
}

private func doubleInInt(_ value: Double) -> String {
    let intValue = Int(value)
    return String(intValue)
}
