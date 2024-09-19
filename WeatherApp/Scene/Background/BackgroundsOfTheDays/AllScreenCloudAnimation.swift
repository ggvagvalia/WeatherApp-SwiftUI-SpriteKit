//
//  AllScreenCloudAnimation.swift
//  WeatherApp
//
//  Created by Data on 13.06.24.
//

import SwiftUI

struct AllScreenCloudAnimation: View {
    @State private var bigBloudOffset1: CGFloat = 180
    @State private var bigBloudOffset2: CGFloat = 30
    @State private var bigBloudOffset3: CGFloat = 150
    @State private var bigBloudOffset4: CGFloat = -180
    @State private var bigBloudOffset5: CGFloat = 120
    @State private var bigBloudOffset6: CGFloat = 100
    
    
    @State private var cloudOffset1: CGFloat = -200
    @State private var cloudOffset2: CGFloat = -100
    @State private var cloudOffset3: CGFloat = -100
    @State private var cloudOffset4: CGFloat = -200
    @State private var cloudOffset5: CGFloat = 100
    @State private var cloudOffset6: CGFloat = -100
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Image(.bigCloud)
                        .resizable()
                        .foregroundColor(.white)
                        .offset(x: bigBloudOffset1)
                        .frame(width: 187.66, height: 80.69)
                        .shadow(color: Color(hex: "#A27270").opacity(0.5), radius: 50)
                }
                .onAppear {
                    bigCloudAnimateCloud()
                }
                VStack {
                    Image(.smallCloud)
                        .resizable()
                        .foregroundColor(.white)
                        .offset(x: cloudOffset1)
                        .frame(width: 64.21, height: 32.42)
                        .shadow(color: Color(hex: "#A27270").opacity(1), radius: 50)
                }
                .onAppear {
                    smallCloudAnimateCloud()
                }
                VStack {
                    Image(.smallCloud)
                        .resizable()
                        .foregroundColor(.white)
                        .offset(x: cloudOffset5)
                        .frame(width: 64.21, height: 32.42)
                        .shadow(color: Color(hex: "#A27270").opacity(1), radius: 50)
                }
                .onAppear {
                    smallCloudAnimateCloud()
                }
                VStack {
                    Image(.smallCloud)
                        .resizable()
                        .foregroundColor(.white)
                        .offset(x: cloudOffset6)
                        .frame(width: 64.21, height: 32.42)
                        .shadow(color: Color(hex: "#A27270").opacity(1), radius: 50)
                }
                .onAppear {
                    smallCloudAnimateCloud()
                }
                VStack {
                    
                    Image(.bigCloud)
                        .resizable()
                        .foregroundColor(.white)
                        .offset(x: bigBloudOffset2)
                        .frame(width: 187.66, height: 80.69)
                        .shadow(color: Color(hex: "#A27270").opacity(0.5), radius: 50)
                }
                .onAppear {
                    bigCloudAnimateCloud()
                }
                
                VStack {
                    Image(.smallCloud)
                        .resizable()
                        .foregroundColor(.white)
                        .offset(x: cloudOffset5)
                        .frame(width: 64.21, height: 32.42)
                        .shadow(color: Color(hex: "#A27270").opacity(1), radius: 50)
                }
                .onAppear {
                    smallCloudAnimateCloud()
                }
                VStack {
                    Image(.bigCloud)
                        .resizable()
                        .foregroundColor(.white)
                        .offset(x: bigBloudOffset5)
                        .frame(width: 187.66, height: 80.69)
                        .shadow(color: Color(hex: "#A27270").opacity(0.5), radius: 50)
                }
                .onAppear {
                    bigCloudAnimateCloud()
                }
                VStack {
                    Image(.smallCloud)
                        .resizable()
                        .foregroundColor(.white)
                        .offset(x: cloudOffset3)
                        .frame(width: 64.21, height: 32.42)
                        .shadow(color: Color(hex: "#A27270").opacity(1), radius: 50)
                }
                .onAppear {
                    smallCloudAnimateCloud()
                }
                
                VStack {
                    Image(.bigCloud)
                        .resizable()
                        .foregroundColor(.white)
                        .offset(x: bigBloudOffset4)
                        .frame(width: 187.66, height: 80.69)
                        .shadow(color: Color(hex: "#A27270").opacity(0.5), radius: 50)
                }
                .onAppear {
                    bigCloudAnimateCloud()
                }
                
                VStack {
                    Image(.bigCloud)
                        .resizable()
                        .foregroundColor(.white)
                        .offset(x: bigBloudOffset3)
                        .frame(width: 57.05, height: 24.42)
                        .shadow(color: Color(hex: "#A27270").opacity(1), radius: 50)
                }
                .onAppear {
                    bigCloudAnimateCloud()
                }
                VStack {
                    Image(.smallCloud)
                        .resizable()
                        .foregroundColor(.white)
                        .offset(x: cloudOffset4)
                        .frame(width: 64.21, height: 32.42)
                        .shadow(color: Color(hex: "#A27270").opacity(1), radius: 50)
                }
                .onAppear {
                    smallCloudAnimateCloud()
                }
                VStack {
                    Image(.smallCloud)
                        .resizable()
                        .foregroundColor(.white)
                        .offset(x: cloudOffset5)
                        .frame(width: 64.21, height: 32.42)
                        .shadow(color: Color(hex: "#A27270").opacity(1), radius: 50)
                }
                .onAppear {
                    smallCloudAnimateCloud()
                }
                VStack {
                    Image(.smallCloud)
                        .resizable()
                        .foregroundColor(.white)
                        .offset(x: cloudOffset6)
                        .frame(width: 64.21, height: 32.42)
                        .shadow(color: Color(hex: "#A27270").opacity(1), radius: 50)
                }
                .onAppear {
                    smallCloudAnimateCloud()
                }
            }
        }
    }
    
    func bigCloudAnimateCloud() {
        withAnimation(Animation.linear(duration: 35.0).repeatForever()) {
            bigBloudOffset1 = -30
            bigBloudOffset2 = -70
            bigBloudOffset3 = 10
            bigBloudOffset4 = -20
            bigBloudOffset5 = -200
            bigBloudOffset6 = -200
        }
    }
    
    func smallCloudAnimateCloud() {
        withAnimation(Animation.linear(duration: 35.0).repeatForever()) {
            cloudOffset1 = 40
            cloudOffset2 = 0
            cloudOffset3 = 40
            cloudOffset4 = -20
            cloudOffset5 = 200
            cloudOffset6 = 10
        }
    }
}

#Preview {
    AllScreenCloudAnimation()
}
