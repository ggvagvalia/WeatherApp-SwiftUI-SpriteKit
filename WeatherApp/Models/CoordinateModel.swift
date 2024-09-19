//
//  CoordinateModel.swift
//  WeatherApp
//
//  Created by Data on 12.06.24.
//

import Foundation

struct CoordinateModel: Decodable, Identifiable {
    var id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    
    private enum CodingKeys: String, CodingKey {
        case name, latitude, longitude
    }
}
