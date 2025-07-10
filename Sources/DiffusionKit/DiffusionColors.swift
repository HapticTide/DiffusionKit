//
//  DiffusionColors.swift
//  DiffusionKit
//
//  Created by Sun on 2025/7/10.
//

import Foundation

public protocol DiffusionColors {
    var colors: [ColorElement] { get }
    
    func make(_ r: Int, _ g: Int, _ b: Int, _ a: Int) -> ColorElement
}

public extension DiffusionColors {
    func make(_ r: Int, _ g: Int, _ b: Int, _ a: Int = 255) -> ColorElement {
        ColorElement(
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            alpha: Double(a) / 255
        )
    }
}
