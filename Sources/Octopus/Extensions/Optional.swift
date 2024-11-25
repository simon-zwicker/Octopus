//
//  Optional.swift
//  Octopus
//
//  Created by Simon Zwicker on 25.11.24.
//

import Foundation

public extension Optional {
    
    /// check if value is nil
    var isNil: Bool {
        self == nil
    }
    
    /// check if value is not nil
    var isNotNil: Bool {
        self != nil
    }
}
