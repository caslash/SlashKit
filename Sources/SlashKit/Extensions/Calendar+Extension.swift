//
//  File.swift
//  
//
//  Created by Cameron Slash on 28/8/22.
//

import Foundation

extension Calendar {
    private var currentDate: Date { Date() }
    
    public func isDateInNextYear(_ date: Date) -> Bool {
        guard let nextYear = self.date(byAdding: DateComponents(year: 1), to: currentDate) else {
            return false
        }
        
        return date < nextYear
    }
    
    public func isDateInNextMonth(_ date: Date) -> Bool {
        guard let nextMonth = self.date(byAdding: DateComponents(month: 1), to: currentDate) else {
            return false
        }
        
        return date < nextMonth
    }
    
    public func isDateInLastDay(_ date: Date) -> Bool {
        guard let lastDay = self.date(byAdding: DateComponents(day: -1), to: currentDate) else {
            return false
        }
        
        return date > lastDay
    }
}
