//
//  ToolbarModel3D.swift
//  my-first-app
//
//  Created by Paulo Tech on 20/05/24.
//

import SwiftUI

struct RotationModificationModel3DWithToolbarItemView: View {
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
        NavigationStack {
            GeometryReader { geometry in
                Model3DItemView(path: path, rotate: false)
                    .modifier(
                        LongPressDetectorModifier(
                            isActive: $isLongPressActive,
                            minimumDuration: 1
                        )
                    )
                    .modifier(DragRotationModifier(yawLimit: .degrees(20), pitchLimit: .degrees(20), sensitivity: 10, axRotateClockwise: false, axRotateCounterClockwise: false)
                    )
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            ToolbarItemGroupModel3DItemView(name: name, description: description, isVolumeWindowOpen: isVolumeWindowOpen, actionOnExpand: openVolumeWindow)
                        }
                    }
                    .onChange(of: isLongPressActive) {
                        if(isLongPressActive) {
                            openVolumeWindow()
                            isLongPressActive = false
                        }
                    }
            }
        }
    }
    
    private func openVolumeWindow() {
        volumeItemPath = path
        if (isVolumeWindowOpen) {
            dismissWindow(id: "volume")
        }
        openWindow(id: "volume")
        print("Opening window...")
        isLongPressActive = false
    }
}

struct RotationModificationModel3DWithToolbarItemView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State private var isLongPressActive = false
        @State var volumeItemPath: String = "AirForce"

        var body: some View {
            ConditionalModificationModel3DWithToolbarItemView(
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
