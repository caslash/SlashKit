//
//  File.swift
//  
//
//  Created by Cameron Slash on 20/8/22.
//

import Foundation

extension CaseIterable where Self: Equatable {
    public func next() -> Self {
        let all = Self.allCases
        let idx = all.firstIndex(of: self)!
        let next = all.index(after: idx)
        return all[next == all.endIndex ? all.startIndex : next]
    }
}
