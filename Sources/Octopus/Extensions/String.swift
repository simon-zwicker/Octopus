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
}
