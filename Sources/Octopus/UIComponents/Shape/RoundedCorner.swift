//
//  RoundedCorner.swift
//  Octopus
//
//  Created by Simon Zwicker on 25.11.24.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

#if canImport(UIKit)
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    nonisolated func path(in rect: CGRect) -> Path {
        let path: UIBezierPath = .init(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: .init(width: radius, height: radius)
        )
        return .init(path.cgPath)
    }
}
#endif
