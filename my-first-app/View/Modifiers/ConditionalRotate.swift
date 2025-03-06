//
//  ConditionalRotate.swift
//  my-first-app
//
//  Created by Paulo Tech on 21/05/24.
//

import SwiftUI

struct ConditionalRotateModifier: ViewModifier {
    var rotate: Bool
    @State var hasRun: Bool = false
    
    func body(content: Content) -> some View {
        if rotate {
            content
                .phaseAnimator([false, true], trigger: hasRun) { (model, rotateXYZ) in
                    model
                        .rotation3DEffect(.degrees(rotateXYZ ? 360: 0), axis: (x: 3, y: -2, z: 0))
                } animation: { rotateXYZ in
                        .smooth(duration:8)
                }
                .onAppear {
                    hasRun = true
                }
        } else {
            content
        }
    }
}
