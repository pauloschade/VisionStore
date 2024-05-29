//
//  ConditionalSelect.swift
//  my-first-app
//
//  Created by Paulo Tech on 24/05/24.
//
import Foundation
import SwiftUI

struct ConditionalSelectModifier<TrueModifier: ViewModifier, FalseModifier: ViewModifier>: ViewModifier {
    @Binding var condition: Bool
    
    var modifierTrue: TrueModifier
    var modifierFalse: FalseModifier

    func body(content: Content) -> some View {
        if condition {
            content.modifier(modifierTrue)
        } else {
            content.modifier(modifierFalse)
        }
    }
}
