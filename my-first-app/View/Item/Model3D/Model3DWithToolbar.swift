//
//  ToolbarModel3D.swift
//  my-first-app
//
//  Created by Paulo Tech on 20/05/24.
//

import SwiftUI

struct Model3DWithToolbarItemView: View {
    var path: String
    var name: String
    var description: String
    let isVolumeWindowOpen: Bool
    

    var body: some View {
        NavigationStack {
            Model3DItemView(path: path, rotate: false)
                .dragRotation(yawLimit: .degrees(20), pitchLimit: .degrees(20))
                .toolbar {
                    ToolbarItemGroup(placement: .bottomOrnament) {
                        ToolbarItemGroupModel3DItemView(name: name, description: description, isVolumeWindowOpen: isVolumeWindowOpen)
                    }
                }
        }
    }
}

#Preview {
    Model3DWithToolbarItemView(path: "AirForce", name: "Shoe", description: "Nice", isVolumeWindowOpen: false)
}
