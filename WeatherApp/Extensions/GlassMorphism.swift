//
//  GlassMorphism.swift
//  WeatherApp
//
//  Created by Luka Gujejiani on 14.06.24.
//

import SwiftUI

public struct TransparentBlurView: UIViewRepresentable {
    public init(removeAllFilters: Bool) {
        self.removeAllFilters = removeAllFilters
    }
    
    var removeAllFilters: Bool = false
    
    public func makeUIView(context: Context) -> TransparentBlurViewHelper {
        return TransparentBlurViewHelper(removeAllFilters: removeAllFilters)
    }
    
    public func updateUIView(_ uiView: TransparentBlurViewHelper, context: Context) {
    }
}

public class TransparentBlurViewHelper: UIVisualEffectView {
    init (removeAllFilters: Bool) {
        super.init(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        
        if subviews.indices.contains(1) {
            subviews[1].alpha = 0
        }
        
        if let backdropLayer = layer.sublayers?.first {
            if removeAllFilters {
                backdropLayer.filters = []
            } else {
                backdropLayer.filters?.removeAll(where: { filter in
                    String(describing: filter) != "gaussianBlur"
                })
            }
        }
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    TransparentBlurView(removeAllFilters: true)
        .padding()
}
