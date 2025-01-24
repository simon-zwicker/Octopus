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
	func gridFlex(_ min: CGFloat, _ max: CGFloat, spacing: CGFloat = 5) -> [GridItem] {
		Array(repeating: .init(.flexible(minimum: min, maximum: max), spacing: spacing), count: self)
    }
    
    /// get grid fixed items on min max
	func gridFixed(_ width: CGFloat, spacing: CGFloat = 5) -> [GridItem] {
		Array(repeating: .init(.fixed(width), spacing: spacing), count: self)
    }
    
    /// get grid adaptive items on min max
	func gridAdaptive(_ min: CGFloat, _ max: CGFloat, spacing: CGFloat = 5) -> [GridItem] {
		Array(repeating: .init(.adaptive(minimum: min, maximum: max), spacing: spacing), count: self)
    }
}

public extension UInt64 {
    
    /// UInt64 to double
    var toDouble: Double {
        Double(self)
    }
}
