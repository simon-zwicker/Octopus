//
//  Shape.swift
//  Octopus
//
//  Created by Simon Zwicker on 25.11.24.
//

import SwiftUI

public extension Shape {
    
    /// create gradient border
    func gradientBorder(_ colors: [Color], width: CGFloat = 1) -> some View {
        self.overlay(
            self.stroke(
                LinearGradient(
                    gradient: .init(colors: colors),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: width
            )
        )
    }
}
