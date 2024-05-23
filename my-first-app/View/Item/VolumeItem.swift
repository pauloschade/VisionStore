//
//  Volume.swift
//  my-first-app
//
//  Created by Paulo Tech on 20/05/24.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent

struct VolumeItemView: View {
    let path: String

    var body: some View {
            Model3D(named: path)
            .dragRotation(
                sensitivity: 3
            )
    }
}

#Preview {
    VolumeItemView(path: "AirForce")
}
