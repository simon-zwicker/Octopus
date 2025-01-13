//
//  Font.swift
//  Octopus
//
//  Created by Simon Zwicker on 13.01.25.
//

import SwiftUI

public extension SwiftUI.Font {
	enum Regular {
		/// Size 10
		public static let verySmall = Font.system(size: 10.0)
		/// Size 12
		public static let small = Font.system(size: 12)
		/// Size 14
		public static let regularSmall = Font.system(size: 14)
		/// Size 16
		public static let regular = Font.system(size: 16)
		/// Size 14
		public static let body = Font.system(size: 14)
		/// Size 18
		public static let title = Font.system(size: 18)
		/// Size 20
		public static let title2 = Font.system(size: 20)
		/// Size 22
		public static let title3 = Font.system(size: 22)
		/// Size 24
		public static let title4 = Font.system(size: 24)
		/// Size 28
		public static let title5 = Font.system(size: 28)
		/// Size 32
		public static let heading1 = Font.system(size: 32)
		/// Size 40
		public static let large = Font.system(size: 40)
		/// Size 54
		public static let extraLarge = Font.system(size: 54)
	}

	enum Bold {
		/// Size 10
		public static let verySmall = Font.system(size: 10.0, weight: .bold)
		/// Size 12
		public static let small = Font.system(size: 12, weight: .bold)
		/// Size 14
		public static let regularSmall = Font.system(size: 14, weight: .bold)
		/// Size 16
		public static let regular = Font.system(size: 16, weight: .bold)
		/// Size 14
		public static let body = Font.system(size: 14, weight: .bold)
		/// Size 18
		public static let title = Font.system(size: 18, weight: .bold)
		/// Size 20
		public static let title2 = Font.system(size: 20, weight: .bold)
		/// Size 22
		public static let title3 = Font.system(size: 22, weight: .bold)
		/// Size 24
		public static let title4 = Font.system(size: 24, weight: .bold)
		/// Size 28
		public static let title5 = Font.system(size: 28, weight: .bold)
		/// Size 32
		public static let heading1 = Font.system(size: 32, weight: .bold)
		/// Size 40
		public static let large = Font.system(size: 40, weight: .bold)
		/// Size 54
		public static let extraLarge = Font.system(size: 54, weight: .bold)
	}

	enum Black {
		/// Size 10
		public static let verySmall = Font.system(size: 10.0, weight: .black)
		/// Size 12
		public static let small = Font.system(size: 12, weight: .black)
		/// Size 14
		public static let regularSmall = Font.system(size: 14, weight: .black)
		/// Size 16
		public static let regular = Font.system(size: 16, weight: .black)
		/// Size 14
		public static let body = Font.system(size: 14, weight: .black)
		/// Size 18
		public static let title = Font.system(size: 18, weight: .black)
		/// Size 20
		public static let title2 = Font.system(size: 20, weight: .black)
		/// Size 22
		public static let title3 = Font.system(size: 22, weight: .black)
		/// Size 24
		public static let title4 = Font.system(size: 24, weight: .black)
		/// Size 28
		public static let title5 = Font.system(size: 28, weight: .black)
		/// Size 32
		public static let heading1 = Font.system(size: 32, weight: .black)
		/// Size 40
		public static let large = Font.system(size: 40, weight: .black)
		/// Size 54
		public static let extraLarge = Font.system(size: 54, weight: .black)
	}
}
