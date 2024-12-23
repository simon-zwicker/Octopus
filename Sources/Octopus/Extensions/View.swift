//
//  View.swift
//  Octopus
//
//  Created by Simon Zwicker on 25.11.24.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

public extension View {
    
    #if canImport(UIKit)
    /// shape specific corners
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    #endif
    
    /// add border style
    func borderStyle(width: CGFloat = 1, color: Color = .gray, cornerRadius: CGFloat = 8) -> some View {
        overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(color, lineWidth: width))
    }
    
    /// Use the view as a button
    ///
    /// - Parameters:
    ///     - _ role: The optional `ButtonRole`
    ///     - action: The action closure for the `Button`
    /// - Returns: Your view wrapped up in a button
    func button(_ role: ButtonRole? = nil, action: @escaping () -> Void) -> some View {
        modifier(ButtonWrapper(role: role, action: action))
    }
}
