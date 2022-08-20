//
//  Sequence+Extension.swift
//  UltimatePortfolio
//
//  Created by Cameron Slash on 10/7/22.
//

import Foundation

extension Sequence {
    public func sorted<Value>(by keyPath: KeyPath<Element, Value>, using areInIncreasingOrder: (Value, Value) throws -> Bool) rethrows -> [Element] {
        try self.sorted {
            try areInIncreasingOrder($0[keyPath: keyPath], $1[keyPath: keyPath])
        }
    }
    
    public func sorted<Value: Comparable>(sortedBy keyPath: KeyPath<Element, Value>, direction: SortDirection = .asc) -> [Element] {
        self.sorted(by: keyPath, using: direction.comparator())
    }
    
    public func sorted(by sortDescriptor: NSSortDescriptor) -> [Element] {
        self.sorted { sortDescriptor.compare($0, to: $1) == .orderedAscending }
    }
}

extension Sequence where Iterator.Element: Hashable {
    public func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}

public enum SortDirection: CaseIterable {
    case asc, desc
}

extension SortDirection {
    public func comparator<T: Comparable>() -> (T,T) -> Bool {
        switch self {
        case .asc:
            return (<)
        case .desc:
            return (>)
        }
    }
}
