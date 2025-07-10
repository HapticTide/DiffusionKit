//
//  DisplayLinkDriver.swift
//  MSDisplayLink
//
//  Created by Sun on 2025/7/10.
//

import Combine
import Foundation

class DisplayLinkDriver: Identifiable {
    let id: UUID = .init()

    private static let sharedLink = DisplayLinkDriverHelper.shared

    typealias SynchornizationPublisher = PassthroughSubject<
        DisplayLinkCallbackContext,
        Never
    >
    let synchronizationPublisher: SynchornizationPublisher

    init() {
        synchronizationPublisher = .init()
        DisplayLinkDriverHelper.shared.delegate(self)
    }

    deinit {
        DisplayLinkDriverHelper.shared.remove(self)
    }

    func synchronize(context: DisplayLinkCallbackContext) {
        synchronizationPublisher.send(context)
    }
}
