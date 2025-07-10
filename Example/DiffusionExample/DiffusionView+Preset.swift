//
//  DiffusionView+Preset.swift
//  DiffusionExample
//
//  Created by Sun on 2025/7/10.
//

import SwiftUI
import DiffusionKit

extension DiffusionView {
    
    /// Initialize the DiffusionView by wrapping around the AnimatedMulticolorGradientView.
    /// - Parameters:
    ///   - preset: the preset to be used, binding set will be omitted and reporting an error when debug
    ///   - speed: speed factor for the animation
    ///   - bias: controls the radiation of the colors, similar to blur factor
    ///   - noise: how many noise you want to use
    ///   - transitionSpeed: how long it tooks to animate when colors changed
    ///   - frameLimit: limit frames per seconds, rounded to vsync (only skip frames, not reschedule)
    ///   - renderScale: similar to view scale, you can set to a very low value if you do not use noise
    ///   - repeats: repeat colors to fill 8 slot for rendering, can be false if your number of colors will stay the same
    init(
        color: Binding<DiffusionPreset>,
        speed: Binding<Double> = .constant(1.0),
        bias: Binding<Double> = .constant(0.01),
        noise: Binding<Double> = .constant(0),
        transitionSpeed: Binding<Double> = .constant(5),
        frameLimit: Binding<Int> = .constant(0),
        renderScale: Binding<Double> = .constant(1.0),
        repeats: Bool = true
    ) {
        let colorBinding = Binding<[Color]>(get: {
            color.wrappedValue.colors.map { .init($0) }
        }, set: { _ in
            assertionFailure()
        })
        self.init(
            color: colorBinding,
            speed: speed,
            bias: bias,
            noise: noise,
            transitionSpeed: transitionSpeed,
            frameLimit: frameLimit,
            renderScale: renderScale,
            repeats: repeats
        )
    }
}
