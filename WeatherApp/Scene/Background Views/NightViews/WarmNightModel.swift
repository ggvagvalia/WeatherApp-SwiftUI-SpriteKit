//
//  WarmNightModel.swift
//  WeatherApp
//
//  Created by Mariam Sreseli on 6/14/24.
//

import SwiftUI

struct Star: Identifiable {
    let id = UUID()
    let imageName: String
    let size: CGFloat
    let offsetX: CGFloat
    let offsetY: CGFloat
    let duration: Double
    let appearTime: Date
    
    var isAppeared: Bool = true
    var isDisappeared: Bool = false
    
    init(imageName: String, size: CGFloat, offsetX: CGFloat, offsetY: CGFloat, duration: Double, appearTime: Date) {
        self.imageName = imageName
        self.size = size
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.duration = duration
        self.appearTime = appearTime
    }
}
