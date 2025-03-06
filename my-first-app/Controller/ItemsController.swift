//
//  ItemsService.swift
//  my-first-app
//
//  Created by Paulo Tech on 29/05/24.
//

import Foundation

class ItemsController {
    private var apiHandler: APIHandlerProtocol
    private var service: ItemsServiceProtocol
    
    init(apiHandler: APIHandlerProtocol, service: ItemsServiceProtocol) {
        self.apiHandler = apiHandler
        self.service = service
    }
    
    func getByCarrierAndScene(carrierId: String, sceneId: String) async -> [ItemModel] {
        return await self.apiHandler.get{ self.service.getByCarrierAndScene(carrierId: carrierId, sceneId: sceneId) }
    }
    
    static func new() -> ItemsController {
        return ItemsController(apiHandler: APIHandlerMock(), service: ItemsService())
    }
}
