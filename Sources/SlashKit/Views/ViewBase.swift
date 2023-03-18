//
//  File.swift
//  
//
//  Created by Cameron Slash on 3/17/23.
//

import Foundation
import SwiftUI

public protocol ViewBase: View {
    associatedtype vm: ViewModelBase
    var viewmodel: vm { get set }
}
