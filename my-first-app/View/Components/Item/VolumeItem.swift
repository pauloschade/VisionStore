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
        
        VStack {
            Model3D(named: path) { (model) in
                model
                    .resizable()
                    .scaledToFit()
                    .dragRotation(
                        sensitivity: 3
                    )
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, idealWidth: 1000, maxWidth: 1000, minHeight: 0, idealHeight: 1000, maxHeight: 1000, alignment: .center)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    VolumeItemView(path: "AirForce")
}
