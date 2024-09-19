//
//  CloudyNightView.swift
//  WeatherApp
//
//  Created by Mariam Sreseli on 6/14/24.
//

import SwiftUI
import SpriteKit

struct CloudyNightView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "0D091A"), Color(hex: "37266E")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            AllScreenCloudAnimation()
                .foregroundColor(Color(hex: "86848F"))
            
            MoonView()
        }
    }
}

#Preview {
    CloudyNightView()
}

