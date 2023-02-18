//
//  File.swift
//  
//
//  Created by Cameron Slash on 2/18/23.
//

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
