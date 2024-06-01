//
//  ItemAPI.swift
//  my-first-app
//
//  Created by Paulo Tech on 28/05/24.
//

import Foundation

class ItemsService: ItemsServiceProtocol {
    func getByCarrierAndScene(carrierId: String, sceneId: String) -> [ItemModel] {
        let carrierSceneId: String = sampleCarrierScene
            .filter { $0.sceneId == sceneId && $0.carrierId == carrierId }[0].id
        
        let itemIds: [String] = sampleCarrierSceneItem
            .filter { $0.carrierSceneId == carrierSceneId }
            .map { $0.itemId }
        
        return sampleItem.filter { itemIds.contains($0.id) }
    }
}
