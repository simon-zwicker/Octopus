//
//  Color.swift
//  Octopus
//
//  Created by Simon Zwicker on 25.11.24.
//

import SwiftUI

public extension Color {
    
    /// Initalize color by Hex code as String
    init(hex: String) {
        let hex: String = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var integer: UInt64 = 0
        
        Scanner(string: hex).scanHexInt64(&integer)
        let a, r, g, b: UInt64
        switch hex.count {
        /// RGB (12-bit)
        case 3:
            (a, r, g, b) = (255, (integer >> 8) * 17, (integer >> 4 & 0xF) * 17, (integer & 0xF) * 17)
            
        /// RGB (24-bit)
        case 6:
            (a, r, g, b) = (255, integer >> 16, integer >> 8 & 0xFF, integer & 0xFF)
            
        /// ARGB (32-bit)
        case 8:
            (a, r, g, b) = (integer >> 24, integer >> 16 & 0xFF, integer >> 8 & 0xFF, integer & 0xFF)
            
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: r.toDouble,
            green: g.toDouble,
            blue: b.toDouble,
            opacity: a.toDouble
        )
    }
    
    /// lighter by percentage (default: 20%)
    func lighter(by percentage: CGFloat = 20) -> Color {
        adjust(by: abs(percentage))
    }
    
    /// darker by percentage (default: 20%)
    func darker(by percentage: CGFloat = 20) -> Color {
        adjust(by: -1 * abs(percentage))
    }
}

/// Private Helpers
private extension Color {
    private var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
        var red, green, blue, opacity: CGFloat
        (red, green, blue, opacity) = (0, 0, 0, 0)
        #if canImport(UIKit)
        guard UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &opacity) else { return (0, 0, 0, 0) }
        #endif
        return (red, green, blue, opacity)
    }
    
    private func adjust(by percentage: CGFloat) -> Color {
        let percentageRaw = percentage / 100
        return Color(
            red: min((components.red + percentageRaw).toDouble, 1.0),
            green: min((components.green + percentageRaw).toDouble, 1.0),
            blue: min((components.blue + percentageRaw).toDouble, 1.0),
            opacity: components.opacity.toDouble
        )
    }
}
