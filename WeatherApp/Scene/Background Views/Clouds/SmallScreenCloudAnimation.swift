//
//  SmallScreenCloudAnimation.swift
//  WeatherApp
//
//  Created by Data on 13.06.24.
//

import SwiftUI

struct SmallScreenCloudAnimation: View {
    @State private var bigBloudOffset1: CGFloat = 180
    @State private var bigBloudOffset2: CGFloat = 30
    @State private var bigBloudOffset3: CGFloat = -180
    
    @State private var cloudOffset1: CGFloat = -200
    @State private var cloudOffset2: CGFloat = -100
    @State private var cloudOffset3: CGFloat = 60
    @State private var cloudOffset4: CGFloat = 60
    
    var body: some View {
        #warning("ZStack არაა საჭირო")
        ZStack {
            VStack {
                VStack {
                    Image(.smallCloud)
                        .resizable()
                        .offset(x: cloudOffset3)
                        .frame(width: 64.21, height: 32.42)
                        .shadow(color: Color(hex: "#A27270").opacity(1), radius: 50)
                }
                .onAppear {
                    smallCloudAnimateCloud()
                }
                VStack {
                    VStack {
                        HStack {
                            VStack {
                                Image(.bigCloud)
                                    .resizable()
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
                                    .offset(x: cloudOffset1)
                                    .frame(width: 64.21, height: 32.42)
                                    .shadow(color: Color(hex: "#A27270").opacity(1), radius: 50)
                            }
                            .onAppear {
                                smallCloudAnimateCloud()
                            }
                        }
                    }
                    #warning("იგივე კოდი მეორდება, ეს კომპონენტი ცალკე სტრუქტურად შეიძლებოდა")
                    VStack {
                        Image(.smallCloud)
                            .resizable()
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
                            .offset(x: cloudOffset4)
                            .frame(width: 116.5, height: 58.82)
                            .shadow(color: Color(hex: "#A27270").opacity(1), radius: 50)
                    }
                    .onAppear {
                        smallCloudAnimateCloud()
                    }
                    VStack {
                        Image(.bigCloud)
                            .resizable()
                            .offset(x: bigBloudOffset3)
                            .frame(width: 187.66, height: 80.69)
                            .shadow(color: Color(hex: "#A27270").opacity(0.5), radius: 50)
                    }
                    .onAppear {
                        bigCloudAnimateCloud()
                    }
                }
                Spacer()
            }
        }
    }
    
    func bigCloudAnimateCloud() {
        withAnimation(Animation.linear(duration: 35.0).repeatForever()) {
            bigBloudOffset1 = -10
            bigBloudOffset2 = -70
        }
    }
    
    func smallCloudAnimateCloud() {
        withAnimation(Animation.linear(duration: 35.0).repeatForever()) {
            cloudOffset1 = 40
            cloudOffset2 = -20
            cloudOffset3 = -20
            cloudOffset4 = -50
        }
    }
}

#Preview {
    SmallScreenCloudAnimation()
}
