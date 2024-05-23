//
//  Model3D.swift
//  my-first-app
//
//  Created by Paulo Tech on 20/05/24.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent

struct Model3DItemView: View {
    let path: String
    let rotate: Bool

    var body: some View {
        VStack {
            Model3D(named: path) { (model) in
                model.resizable()
                    .scaledToFit()
                    .scaleEffect(0.3)
                    .modifier(ConditionalRotate(rotate: rotate))
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    Model3DItemView(path: "AirForce", rotate: true)
}
