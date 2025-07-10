//
//  Lerpable.swift
//  DiffusionKit
//
//  Created by Sun on 2025/7/10.
//

import ColorVector
import MetalKit

protocol Lerpable {
    func lerp(to newValue: Self, percent delta: Double) -> Self
}

extension Float: Lerpable {
    func lerp(to newValue: Self, percent delta: Double) -> Self {
        self + (newValue - self) * Float(delta)
    }
}

extension Double: Lerpable {
    func lerp(to newValue: Self, percent delta: Double) -> Self {
        self + (newValue - self) * delta
    }
}

extension ColorVector: Lerpable {
    func lerp(to: ColorVector, percent delta: Double) -> ColorVector {
        assert(space == to.space)
        if delta <= 0 { return self }
        if delta >= 1 { return to }
        let fromValue = v
        let toValue = to.v
        var result = SIMD4<Double>()
        for i in 0 ..< 4 {
            result[i] = fromValue[i].lerp(to: toValue[i], percent: delta)
        }
        return .init(v: result, space: space)
    }
}
