//
//  Dat.swift
//  WeatherApp
//
//  Created by Luka Gujejiani on 12.06.24.
//

import Foundation
import SwiftData

@Model
final class CityData: Identifiable {
    @Attribute var name: String
    @Attribute var latitude: Double
    @Attribute var longitude: Double
    
    init(city: CoordinateModel) {
        self.name = city.name
        self.latitude = city.latitude
        self.longitude = city.longitude
    }
}
