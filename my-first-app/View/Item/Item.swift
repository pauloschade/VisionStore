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

    var body: some View {
        if let path = filePath3D {
            Model3DWithToolbarItemView(path: path, name: "name", description: "details", isVolumeWindowOpen: isVolumeWindowOpen)
        }
    }
}


#Preview {
    ItemView(filePath3D: "AirForce", isVolumeWindowOpen: false)
        .padding()
}
