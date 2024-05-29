//
//  DragMovement.swift
//  my-first-app
//
//  Created by Paulo Tech on 24/05/24.
//
import SwiftUI

/// A modifier that enables direct dragging to move a view.
struct DragMovementModifier: ViewModifier {
    @GestureState private var dragState: DragState = DragState.inactive
    
    
    var initialPosition: CGPoint
    @State var position: CGPoint
    
    var actionOnEnded: () -> Void
    var actionOnUpdated: (CGPoint) -> Void

    init(initialPosition: CGPoint, actionOnEnded: @escaping () -> Void,  actionOnUpdated: @escaping (CGPoint) -> Void) {
        self.initialPosition = initialPosition
        _position = State(initialValue: initialPosition)
        self.actionOnEnded = actionOnEnded
        self.actionOnUpdated = actionOnUpdated
    }

    func body(content: Content) -> some View {
        content
            .position(position)
            .gesture(
                DragGesture()
                    .updating($dragState) { value, state, _ in
                        state = .dragging(translation: value.translation)
                    }
                    .onChanged { gesture in
                        let dragTranslation = gesture.translation
                        position = CGPoint(x: initialPosition.x + dragTranslation.width, y: initialPosition.y + dragTranslation.height)
                        actionOnUpdated(position)
                    }
                    .onEnded { _ in
                        position = initialPosition
                        actionOnEnded()
                    }
            )
    }

    enum DragState {
        case inactive
        case dragging(translation: CGSize)
    }
}

