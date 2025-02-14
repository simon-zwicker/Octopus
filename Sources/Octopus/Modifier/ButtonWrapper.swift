//
//  ButtonWrapper.swift
//  Octopus
//
//  Created by Simon Zwicker on 25.11.24.
//

import SwiftUI

struct ButtonWrapper: ViewModifier {
    
    var role: ButtonRole?
    var action: () -> Void

    func body(content: Content) -> some View {
        Button(
            role: role,
            action: { action() },
            label: { content }
        )
    }
}
