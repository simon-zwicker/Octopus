//
//  Color.swift
//  Octopus
//
//  Created by Simon Zwicker on 25.11.24.
//

import SwiftUI

public extension Color {

	init(hex: String) {
		let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
		var int: UInt64 = 0
		Scanner(string: hex).scanHexInt64(&int)

		let a, r, g, b: Double
		switch hex.count {
		case 6: // RGB (No Alpha)
			(a, r, g, b) = (1, Double((int >> 16) & 0xFF) / 255, Double((int >> 8) & 0xFF) / 255, Double(int & 0xFF) / 255)
		case 8: // ARGB
			(a, r, g, b) = (Double((int >> 24) & 0xFF) / 255, Double((int >> 16) & 0xFF) / 255, Double((int >> 8) & 0xFF) / 255, Double(int & 0xFF) / 255)
		default:
			(a, r, g, b) = (1, 1, 1, 1) // Default to white if invalid
		}

		self.init(red: r, green: g, blue: b, opacity: a)
	}

	var saturation: Double {
		getHSB()?.saturation ?? 1
	}

	var brightness: Double {
		getHSB()?.brightness ?? 1
	}

	var hue: Double {
		getHSB()?.hue ?? 0
	}

	var isDark: Bool {
		let components = UIColor(self).cgColor.components ?? [0, 0, 0, 1]
		let red = components[0]
		let green = components[1]
		let blue = components[2]
		let luminance = (0.299 * red + 0.587 * green + 0.114 * blue)

		return luminance < 0.3
	}

    /// lighter by percentage (default: 20%)
    func lighter(by percentage: CGFloat = 20) -> Color {
        adjust(by: abs(percentage))
    }
    
    /// darker by percentage (default: 20%)
    func darker(by percentage: CGFloat = 20) -> Color {
        adjust(by: -1 * abs(percentage))
    }

	func toHex(withAlpha: Bool = false) -> String? {
		guard let components = UIColor(self).cgColor.components else { return nil }

		let r = Int(components[0] * 255)
		let g = Int(components[1] * 255)
		let b = Int(components[2] * 255)
		let a = components.count >= 4 ? Int(components[3] * 255) : 255

		return withAlpha ? String(format: "#%02X%02X%02X%02X", a, r, g, b): String(format: "#%02X%02X%02X", r, g, b)
	}
}

/// Private Helpers
private extension Color {
	private func getHSB() -> (hue: Double, saturation: Double, brightness: Double, alpha: Double)? {
		// Convert SwiftUI Color to UIColor
		let uiColor = UIColor(self)

		// Get Hue, Saturation, and Brightness
		var hue: CGFloat = 0
		var saturation: CGFloat = 0
		var brightness: CGFloat = 0
		var alpha: CGFloat = 0

		guard uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) else {
			return nil // Return nil if conversion fails
		}

		return (Double(hue), Double(saturation), Double(brightness), Double(alpha))
	}

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
