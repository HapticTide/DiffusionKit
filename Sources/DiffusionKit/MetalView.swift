//
//  MetalView.swift
//  DiffusionKit
//
//  Created by Sun on 2025/7/10.
//

import Foundation

#if canImport(UIKit)
    public typealias MetalView = UIMetalView
#endif

#if !canImport(UIKit) && canImport(AppKit)
    public typealias MetalView = NSMetalView
#endif
