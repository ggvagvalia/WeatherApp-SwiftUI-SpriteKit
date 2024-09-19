//
//  WarmNightView.swift
//  WeatherApp
//
//  Created by Mariam Sreseli on 6/14/24.
//

import SwiftUI

struct WarmNightView: View {
    @State private var stars: [Star] = {
        var starsArray: [Star] = []
        let maxStarsCount = 100
        
        for _ in 0..<maxStarsCount {
            let size = CGFloat.random(in: 10...80)
            let offsetX = CGFloat.random(in: -UIScreen.main.bounds.width...UIScreen.main.bounds.width)
            let offsetY = CGFloat.random(in: -UIScreen.main.bounds.height...UIScreen.main.bounds.height)
            let duration = Double.random(in: 0...6)
            let imageName = "Star"
            let appearTime = Date()
            
            starsArray.append(Star(imageName: imageName, size: size, offsetX: offsetX, offsetY: offsetY, duration: duration, appearTime: appearTime))
        }
        return starsArray
    }()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "140E28"), Color(hex: "4F369F")]),
                startPoint: .top,
                endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            ForEach(stars) { star in
                if star.isAppeared {
                    Image(star.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: star.size, height: star.size)
                        .offset(x: star.offsetX, y: star.offsetY)
                        .opacity(opacity(for: star))
                        .animation(.easeInOut(duration: 0.5))
                        .onAppear {
                            scheduleRemoval(for: star)
                        }
                }
            }
            MoonView()
        }
    }
    
    //MARK: - functions:
    private func scheduleRemoval(for star: Star) {
        DispatchQueue.main.asyncAfter(deadline: .now() + star.duration) {
            if let index = stars.firstIndex(where: { $0.id == star.id }) {
                stars.remove(at: index)
                generateStar()
            }
        }
    }
    
    private func generateStar() {
        let size = CGFloat.random(in: 10...80)
        let offsetX = CGFloat.random(in: -UIScreen.main.bounds.width...UIScreen.main.bounds.width)
        let offsetY = CGFloat.random(in: -UIScreen.main.bounds.height...UIScreen.main.bounds.height)
        let duration = Double.random(in: 3...6)
        let imageName = "Star"
        let appearTime = Date()
        
        stars.append(Star(imageName: imageName, size: size, offsetX: offsetX, offsetY: offsetY, duration: duration, appearTime: appearTime))
    }
    
    private func opacity(for star: Star) -> Double {
        let appearanceDuration = star.duration * 0.8
        let elapsedTime = Date().timeIntervalSince(star.appearTime)
        
        if elapsedTime < appearanceDuration {
            return min(elapsedTime / appearanceDuration, 1.0)
        } else {
            let fadeOutDuration = star.duration - appearanceDuration
            let timeSinceFadeOutStart = elapsedTime - appearanceDuration
            return max(1.0 - (timeSinceFadeOutStart / fadeOutDuration), 0.0)
        }
    }
}

#Preview {
    WarmNightView()
}

