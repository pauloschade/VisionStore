//
//  Expand.swift
//  my-first-app
//
//  Created by Paulo Tech on 22/05/24.
//

import SwiftUI

struct ExpandButtonView: View {
    // Define a closure property to hold the action to be performed on tap
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {  // Use the closure property as the button action
            Image(systemName: "arrow.up.backward.and.arrow.down.forward.circle.fill")
                .symbolRenderingMode(.hierarchical)
                .font(.largeTitle)
                .padding()
        }
        .buttonStyle(PlainButtonStyle()) // Apply a plain button style
        .background(Color.clear) // Optional: Ensure no background color
    }
}

#Preview {
    ExpandButtonView {
        print("btn was pressed")
    }
}
