//
//  App.swift
//  DiffusionExample
//
//  Created by Sun on 2025/7/10.
//

import DiffusionKit
import SwiftUI

struct App: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        #if os(macOS)
        .windowResizability(.contentSize)
        .windowStyle(.hiddenTitleBar)
        .windowToolbarStyle(.unifiedCompact)
        #endif
    }
}
