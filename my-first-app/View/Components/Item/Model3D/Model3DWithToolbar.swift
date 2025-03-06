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
    @Binding var isLongPressActive: Bool
    @Binding var volumeItemPath: String
    @State var objectPosition: CGPoint = .zero
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        RotationModificationModel3DWithToolbarItemView(path: path, name: name, description: description, isVolumeWindowOpen: isVolumeWindowOpen, isLongPressActive: $isLongPressActive, volumeItemPath: $volumeItemPath)
    }
}

struct Model3DWithToolbarItemView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State private var isLongPressActive = false
        @State var volumeItemPath: String = "AirForce"

        var body: some View {
            Model3DWithToolbarItemView(
                path: "AirForce",
                name: "Shoe",
                description: "Nice",
                isVolumeWindowOpen: false,
                isLongPressActive: $isLongPressActive,
                volumeItemPath: $volumeItemPath
            )
        }
    }
}
