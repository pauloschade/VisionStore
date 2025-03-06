//
//  AppController.swift
//  my-first-app
//
//  Created by Paulo Tech on 29/05/24.
//

import Foundation

class AppController {
    var eventsController: EventsController
    var scenesController: ScenesController
    var carriersController: CarriersController
    var itemsController: ItemsController
    
    static var shared: AppController = {
        let instance = AppController(eventsController: EventsController.new(), scenesController: ScenesController.new(), carriersController: CarriersController.new(), itemsController: ItemsController.new())
        return instance
    }()

    /// The Singleton's initializer should always be private to prevent direct
    /// construction calls with the `new` operator.
    private init(eventsController: EventsController, scenesController: ScenesController, carriersController: CarriersController, itemsController: ItemsController) {
        self.eventsController = eventsController
        self.scenesController = scenesController
        self.carriersController = carriersController
        self.itemsController = itemsController
    }
}
