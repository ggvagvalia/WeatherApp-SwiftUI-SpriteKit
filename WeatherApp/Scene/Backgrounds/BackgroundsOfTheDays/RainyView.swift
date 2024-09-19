//
//  RainyView.swift
//  WeatherApp
//
//  Created by Data on 13.06.24.
//

import SwiftUI

struct RainyView: View {
    var body: some View {
        ZStack {
//            CloudAnimation1()
//            GeometryReader {_ in
//                SpriteView(scene: SnowFall(),options: [.allowsTransparency])
//                    .ignoresSafeArea()
//            }
            VStack {
                HStack {
                    Spacer()
                        .frame(width: 8)
                    Image("Sun")
                        .resizable()
                        .frame(width: 138.18, height: 138.18)
//                        .foregroundStyle(
//                            LinearGradient(gradient: Gradient(colors: [Color.sunLeading, Color.sunTrailing]), startPoint: .leading, endPoint: .trailing)
//                        )
                    Spacer()
                        .frame(width: 230)
                }
                Spacer()
            }
            
        }
//        .background(
//            LinearGradient(gradient: Gradient(colors: [Color.snowyTop, Color.snowyBottom]), startPoint: .top, endPoint: .bottom)
//        )
    }
}

#Preview {
    RainyView()
}
