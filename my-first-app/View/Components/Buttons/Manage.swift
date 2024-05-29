//
//  VoteButtonsView.swift
//  my-first-app
//
//  Created by Paulo Tech on 18/05/24.
//

import Foundation
import SwiftUI

struct ManageButtonsView: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    let windowID: String
    
    @State var isActive: Bool = false
    
    var body: some View {
        HStack(spacing: 20) {
            // Upvote button appears if isActive is true
            if isActive {
                VStack {
                    Button(action: {
                        addWindow()
                    }) {
                        Image(systemName: "arrow.up")
                            .font(.title)
                    }
                    .transition(.slide) // Transition effect for appearing/disappearing
                }
            }
            
            // Middle button (perhaps a neutral action)
            ToggleButtonView(isActive: $isActive)
            
            // Downvote button appears if isActive is true
            if isActive {
                VStack {
                    Button(action: {
                        removeWindow()
                    }) {
                        Image(systemName: "arrow.down")
                            .font(.title)
                    }
                    .transition(.slide) // Transition effect for appearing/disappearing
                }
            }
        }
        .padding()
        .foregroundColor(.blue)
        .animation(.easeInOut, value: isActive) // Animate the transition based on isActive
    }
    
    func addWindow() {
        openWindow(id: windowID)
    }
    
    func removeWindow() {
        dismissWindow(id: windowID)
    }
}
