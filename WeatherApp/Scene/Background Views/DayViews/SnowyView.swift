//
//  SnowyView.swift
//  WeatherApp
//
//  Created by Data on 13.06.24.
//

import SwiftUI
import SpriteKit

struct SnowyView: View {
    var body: some View {
        ZStack {
            SmallScreenCloudAnimation()
                .foregroundColor(Color(hex: "FFFFFF"))
            GeometryReader {_ in
                SpriteView(scene: SnowFall(),options: [.allowsTransparency])
                    .ignoresSafeArea()
            }
            VStack {
                HStack {
                    Spacer()
                        .frame(width: 8)
                    Image("Sun")
                        .resizable()
                        .frame(width: 138.18, height: 138.18)
                        .foregroundStyle(
                            LinearGradient(gradient: Gradient(colors: [Color(hex: "FFA900"), Color(hex: "FFD88B")]), startPoint: .leading, endPoint: .trailing)
                        )
                    Spacer()
                }
                Spacer()
            }
            
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(hex: "89A6D9"), Color(hex: "6E819A")]), startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    SnowyView()
}
