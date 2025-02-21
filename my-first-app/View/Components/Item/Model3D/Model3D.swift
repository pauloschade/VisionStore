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
    let opacity: Double = 1

    var body: some View {
        VStack {
            Model3D(named: path) { (model) in
                model
                    .resizable()
                    .scaledToFit()
//                    .scaleEffect(0.3)
                    .frame(minWidth: 0, idealWidth: 200, maxWidth: 200, minHeight: 0, idealHeight: 200, maxHeight: 200, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .modifier(ConditionalRotateModifier(rotate: rotate))
                    .opacity(opacity)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    Model3DItemView(path: "Porsche911", rotate: true)
}
