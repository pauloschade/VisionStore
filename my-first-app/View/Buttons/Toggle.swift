//
//  OpenButton.swift
//  my-first-app
//
//  Created by Paulo Tech on 17/05/24.
//

import Foundation
import SwiftUI

struct ToggleButtonView: View {
    
    @Binding var isActive: Bool
    
    var body: some View {
        Button(action: {
            isActive.toggle()
        }) {
            Circle()
                .fill(isActive ? Color.blue : Color.gray)
                .frame(width: 50, height: 50)
        }
        .buttonStyle(.plain)
    }
}
