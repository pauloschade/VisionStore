//
//  ScenesController.swift
//  my-first-app
//
//  Created by Paulo Tech on 29/05/24.
//

import Foundation

class ScenesController {
    private var apiHandler: APIHandlerProtocol
    private var service: ScenesServiceProtocol
    
    init(apiHandler: APIHandlerProtocol, service: ScenesServiceProtocol) {
        self.apiHandler = apiHandler
        self.service = service
    }
    
    func getByEvent(eventId: String) async -> [SceneModel] {
        return await self.apiHandler.get{ self.service.getByEvent(eventId: eventId) }
    }
    
    func getCurrentByEvent(eventId: String, currentTimeSeconds: Int) async -> SceneModel? {
        return await self.apiHandler.getOne { self.service.getCurrentByEvent(eventId: eventId, currentTimeSeconds: currentTimeSeconds) }
    }
    
    static func new() -> ScenesController {
        return ScenesController(apiHandler: APIHandlerMock(), service: ScenesService())
    }
}
