//
//  LongPress.swift
//  my-first-app
//
//  Created by Paulo Tech on 24/05/24.
//
import SwiftUI

struct LongPressDetectorModifier: ViewModifier {
    @Binding var isActive: Bool
    
    let minimumDuration: Double
    
    var actionOnEnded: (Bool) -> Void = { myVariable in
        print("long pressed: \(myVariable)")
    }

    func body(content: Content) -> some View {
        content
            .gesture(
                LongPressGesture(minimumDuration: minimumDuration)
                    .onEnded { _ in
                        isActive = true
                        actionOnEnded(isActive)
                    }
            )
    }
}
