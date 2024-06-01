//
//  CarriersController.swift
//  my-first-app
//
//  Created by Paulo Tech on 29/05/24.
//

import Foundation

class CarriersController {
    private var apiHandler: APIHandlerProtocol
    private var service: CarriersServiceProtocol
    
    init(apiHandler: APIHandlerProtocol, service: CarriersServiceProtocol) {
        self.apiHandler = apiHandler
        self.service = service
    }
    
    func getByScene(sceneId: String) async -> [CarrierModel] {
        return await self.apiHandler.get{ self.service.getByScene(sceneId: sceneId) }
    }
    
    static func new() -> CarriersController {
        return CarriersController(apiHandler: APIHandlerMock(), service: CarriersService())
    }
}
