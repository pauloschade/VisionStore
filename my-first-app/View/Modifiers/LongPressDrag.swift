//
//  LongPressDrag.swift
//  my-first-app
//
//  Created by Paulo Tech on 23/05/24.
//

import SwiftUI

extension View {
    /// Enables movement of a view after a long press gesture.
    func longPressDrag(
        initialPosition: CGPoint,
        minimumDuration: Double = 0.7,
        actionOnLongPressEnded: @escaping () -> Void = {}
    ) -> some View {
        self.modifier(
            LongPressDragModifier(
                initialPosition: initialPosition,
                minimumDuration: minimumDuration,
                actionOnLongPressEnded: actionOnLongPressEnded
            )
        )
    }
}

/// A modifier that combines long press and drag gestures to move a view.
private struct LongPressDragModifier: ViewModifier {
    var initialPosition: CGPoint
    var minimumDuration: Double
    var actionOnLongPressEnded: () -> Void

    @GestureState private var isDragging = false
    @State private var shouldMove = false
    @State private var position: CGPoint

    init(initialPosition: CGPoint, minimumDuration: Double, actionOnLongPressEnded: @escaping () -> Void) {
        self.initialPosition = initialPosition
        self.minimumDuration = minimumDuration
        self.actionOnLongPressEnded = actionOnLongPressEnded
        _position = State(initialValue: initialPosition)
    }

    func body(content: Content) -> some View {
        content
            .position(x: position.x, y: position.y)
            .gesture(
                LongPressGesture(minimumDuration: minimumDuration)
                    .onEnded { _ in
                        actionOnLongPressEnded()
                        shouldMove = true
                    }
                    .simultaneously(with: DragGesture()
                        .updating($isDragging) { _, state, _ in
                            state = true
                        }
                        .onChanged { gesture in
                            if shouldMove {
                                // Calculate new position based on initial position plus drag translation.
                                let dragTranslation = gesture.translation
                                position = CGPoint(x: initialPosition.x + dragTranslation.width, y: initialPosition.y + dragTranslation.height)
                            }
                        }
                        .onEnded { _ in
                            shouldMove = false
                        }
                    )
            )
    }
}

