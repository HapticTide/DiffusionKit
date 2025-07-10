//
//  PlatformCheck.swift
//  DiffusionKit
//
//  Created by Sun on 2025/7/10.
//

import Foundation

#if !canImport(UIKit) && !canImport(AppKit)
#error("Unsupported Platform")
#endif
