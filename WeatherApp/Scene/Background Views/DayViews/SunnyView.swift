//
//  SunnyView.swift
//  WeatherApp
//
//  Created by Data on 13.06.24.
//

import SwiftUI

struct SunnyView: View {
    var body: some View {
        ZStack {
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
                    VStack {
#warning("კაი იქნებოდა Image ები სტრინგების ნაცვლად ახლებურად დაგეწერათ:")
                        Image(.tolia)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30.11, height: 31.98)
                            .padding(.leading, 30)
                        Image("Tolia")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30.11, height: 31.98)
                            .padding(.leading, -50)
                        Image(.tolia)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30.11, height: 31.98)
                            .padding(.top, -10)
                    }
                    .padding(.top, -40)
                    Spacer()
                }
                Spacer()
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(hex: "2DB0DD"), Color(hex: "8EADE1")]), startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    SunnyView()
}
