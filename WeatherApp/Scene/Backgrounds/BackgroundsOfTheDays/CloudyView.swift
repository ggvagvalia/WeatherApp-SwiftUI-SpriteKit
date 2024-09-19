//
//  CloudyView.swift
//  WeatherApp
//
//  Created by Data on 13.06.24.
//

import SwiftUI

struct CloudyView: View {
    var body: some View {
        ZStack {
//            CloudAnimation()
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
                }
                Spacer()
            }
        }
//        .background(
//            LinearGradient(gradient: Gradient(colors: [Color.cloudlyTop, Color.cloudlyBottom]), startPoint: .top, endPoint: .bottom)
//        )
    }
}

#Preview {
    CloudyView()
}
