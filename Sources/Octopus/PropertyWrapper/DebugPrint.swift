//
//  DebugPrint.swift
//  Octopus
//
//  Created by Simon Zwicker on 25.11.24.
//

/// debug Print to print always the inital value & when the value changed
@propertyWrapper
public struct DebugPrint<T> {
    
    /// print when value changed
    public var wrappedValue: T {
        didSet { print("[\(String(describing: T.self))] Changed: \(wrappedValue)") }
    }
    
    /// print when value is initialized
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        print("[\(String(describing: T.self)) Initial: \(wrappedValue)]")
    }
}
