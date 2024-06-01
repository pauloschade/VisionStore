//
//  SceneState.swift
//  my-first-app
//
//  Created by Paulo Tech on 29/05/24.
//

import Foundation

class SceneStateManager: ObservableObject {
    @Published var scene: SceneModel? = nil
    @Published var carriers: [CarrierModel] = []
}
