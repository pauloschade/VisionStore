//
//  ToolbarItemGroup.swift
//  my-first-app
//
//  Created by Paulo Tech on 22/05/24.
//

import Foundation
import SwiftUI

struct ToolbarItemGroupModel3DItemView: View {
    let name: String
    let description: String
    let isVolumeWindowOpen: Bool
    
    var actionOnExpand: () -> Void
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        ExpandButtonView() {
            actionOnExpand()
        }
        
        Image(systemName: "square.and.arrow.up.circle.fill")
            .symbolRenderingMode(.hierarchical)
            .font(.largeTitle)
        
        Spacer()
        
        VStack {
            Text(name)
                .font(.largeTitle)
            Text(description)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 64)
        
        Spacer()
        
        Button("Buy") {
            // Define the buy action here
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
}

#Preview {
    ToolbarItemGroupModel3DItemView(name: "name", description: "description", isVolumeWindowOpen: false, actionOnExpand: {
        print("Expand")
    })
}
