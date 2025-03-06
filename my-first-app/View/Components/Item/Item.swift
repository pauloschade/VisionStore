//
//  Item.swift
//  my-first-app
//
//  Created by Paulo Tech on 19/05/24.
//
import SwiftUI
import RealityKit
import RealityKitContent

struct ItemView: View {
    let filePath3D: String?
    let modelDepth: Double = 200
    let isVolumeWindowOpen: Bool
    @Binding var volumeItemPath: String
    
    @StateObject private var gestureController = GestureStateController()
    
    

    var body: some View {
        ZStack {
            if let path = filePath3D {
                Model3DWithToolbarItemView(path: path, name: "name", description: "details", isVolumeWindowOpen: isVolumeWindowOpen, isLongPressActive: $gestureController.isLongPressActive, volumeItemPath: $volumeItemPath)
            }
        }
    }
}


struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a local state to bind to the isLongPressActive
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        let isVolumeWindowOpen: Bool = false
        @State var volumeItemPath: String = "AirForce"

        var body: some View {
            ItemView(filePath3D: volumeItemPath, isVolumeWindowOpen: isVolumeWindowOpen, volumeItemPath: $volumeItemPath)
        }
    }
}
