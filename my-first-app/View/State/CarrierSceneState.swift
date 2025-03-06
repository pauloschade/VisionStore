//
//  CarrierSceneState.swift
//  my-first-app
//
//  Created by Paulo Tech on 29/05/24.
//

import Foundation

class CarrierSceneStateManager: ObservableObject {
    @Published var scene: SceneModel? = nil
    @Published var carrier: CarrierModel? = nil
    @Published var items: [ItemModel] = []
}
