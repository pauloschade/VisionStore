//
//  EventsController.swift
//  my-first-app
//
//  Created by Paulo Tech on 29/05/24.
//

import Foundation

class EventsController {
    private var apiHandler: APIHandlerProtocol
    private var service: EventsServiceProtocol
    
    init(apiHandler: APIHandlerProtocol, service: EventsServiceProtocol) {
        self.apiHandler = apiHandler
        self.service = service
    }
    
    func get() async -> [EventModel] {
        return await self.apiHandler.get{ self.service.get() }
    }
    
    static func new() -> EventsController {
        return EventsController(apiHandler: APIHandlerMock(), service: EventsService())
    }
}
