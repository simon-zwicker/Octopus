//
//  EnvironmentBinding.swift
//  Octopus
//
//  Created by Simon Zwicker on 24.11.24.
//

import SwiftUI

/// Property wrapper to get an bindable observable object from an environment
@propertyWrapper
public struct EnvironmentBinding<T: Observable & AnyObject>: DynamicProperty {
    /// Access the object what should be observable, over the Environment
    @Environment(T.self) private var object
    
    /// current object from environment
    public var wrappedValue: T { _object.wrappedValue }
    
    /// two-way binding projection of the object, can be used now in SwiftUI Views
    public var projectedValue: Bindable<T> {
        @Bindable var wrappedValue = wrappedValue
        return $wrappedValue
    }
    
    /// initialize new instance of BindableEnv
    public init() {}
}
