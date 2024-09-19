//
//  RainyNightView.swift
//  WeatherApp
//
//  Created by Mariam Sreseli on 6/14/24.
//

import SwiftUI
import SpriteKit

struct RainyNightView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "050C14"), Color(hex: "2A2C2E")]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            SmallScreenCloudAnimation()
                .foregroundStyle(Color(hex: "86848F"))
            GeometryReader {_ in
                SpriteView(scene: RainFall(),options: [.allowsTransparency])
                    .ignoresSafeArea()
            }
            MoonView()
        }
    }
}

#Preview {
    RainyNightView()
}

