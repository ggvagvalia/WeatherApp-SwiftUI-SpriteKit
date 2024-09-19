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
            AllScreenCloudAnimation()
                .foregroundColor(Color(hex: "FFFFFF"))
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
            LinearGradient(gradient: Gradient(colors: [Color(hex: "373F4E"), Color(hex: "ACB7BF")]), startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    CloudyView()
}
