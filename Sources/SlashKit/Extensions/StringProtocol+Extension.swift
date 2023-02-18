//
//  File.swift
//  
//
//  Created by Cameron Slash on 2/18/23.
//

import Foundation

extension StringProtocol {
    public subscript(offset: Int) -> Character {
        return self[index(startIndex, offsetBy: offset)]
    }
}
