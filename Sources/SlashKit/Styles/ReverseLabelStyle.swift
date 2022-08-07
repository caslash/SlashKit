//
//  ReverseLabelStyle.swift
//  CounterKit
//
//  Created by Cameron Slash on 15/7/22.
//

import Foundation
import SwiftUI

public struct ReverseLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
    
    public init() { }
}
