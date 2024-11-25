//
//  Int.swift
//  Octopus
//
//  Created by Simon Zwicker on 25.11.24.
//

import SwiftUI

public extension Int {
    
    /// check is integer is even
    var isEven: Bool {
        self % 2 == 0
    }
    
    /// integer to double
    var toDouble: Double {
        Double(self)
    }
    
    /// get griditem on value
    var grid: [GridItem] {
        var items: [GridItem] = []
        for _ in 0..<self { items.append(.init()) }
        return items
    }
    
    /// get grid flex items on min max
    func gridFlex(_ min: CGFloat, _ max: CGFloat) -> [GridItem] {
        var items: [GridItem] = []
        for _ in 0..<self { items.append(.init(.flexible(minimum: min, maximum: max))) }
        return items
    }
    
    /// get grid fixed items on min max
    func gridFixed(_ width: CGFloat) -> [GridItem] {
        var items: [GridItem] = []
        for _ in 0..<self { items.append(.init(.fixed(width))) }
        return items
    }
    
    /// get grid adaptive items on min max
    func gridAdaptive(_ min: CGFloat, _ max: CGFloat) -> [GridItem] {
        var items: [GridItem] = []
        for _ in 0..<self { items.append(.init(.adaptive(minimum: min, maximum: max))) }
        return items
    }
}

public extension UInt64 {
    
    /// UInt64 to double
    var toDouble: Double {
        Double(self)
    }
}
