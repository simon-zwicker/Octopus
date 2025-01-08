//
//  String.swift
//  Octopus
//
//  Created by Simon Zwicker on 25.11.24.
//

import SwiftUI

public extension String {
    
    /// check if string is not empty
    var isNotEmpty: Bool { !isEmpty }
    
    /// get string as localizable key for string catalog
    var l10n: LocalizedStringKey { .init(self) }
    
    /// get characters of string as array
    var toArray: [Character] { Array(self) }

	///decode String to base64
	var base64UrlDecode: String {
		var base64 = self
			.replacingOccurrences(of: "-", with: "+")
			.replacingOccurrences(of: "_", with: "/")

		while base64.count.isMultiple(of: 4) {
			base64 += "="
		}

		return base64
	}

	///check if a JWT is Expired
	var isJWTExpired: Bool {
		let components = self.split(separator: ".")
		guard components.count == 3 else {
			print("Invalid JWT format")
			return true
		}

		let payloadData = Data(base64Encoded: String(components[1]).base64UrlDecode)
		guard let payloadData = payloadData else {
			print("Failed to decode JWT payload")
			return true
		}

		guard
			let payloadJson = try? JSONSerialization.jsonObject(with: payloadData, options: []),
			let payload = payloadJson as? [String: Any],
			let exp = payload["exp"] as? TimeInterval
		else {
			print("Failed to parse JWT payload or find 'exp' field")
			return true
		}

		let expirationDate = Date(timeIntervalSince1970: exp)
		return expirationDate <= Date()
	}
}
