//
//  MoonView.swift
//  WeatherApp
//
//  Created by Mariam Sreseli on 6/14/24.
//

import SwiftUI

struct MoonView: View {
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image("Moon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 129, height: 133)
                        .foregroundStyle(Color(hex: "D5D5D5"))
                    
                    Image("Sparkle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 129, height: 133)
                        .mask(
                            Image("Moon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 129, height: 133)
                        )
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                
                Spacer()
            }
            Spacer()
        }
    }
}

