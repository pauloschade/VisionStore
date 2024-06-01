//
//  EventState.swift
//  my-first-app
//
//  Created by Paulo Tech on 29/05/24.
//

import Foundation

class EventStateManager: ObservableObject {
    @Published var event: EventModel? = nil
    @Published var scenes: [SceneModel] = []
    @Published var currentScene: SceneModel? = nil
    
    static func initMock() -> EventStateManager {
        var esm = EventStateManager()
        esm.event = sampleEvent[0]
        esm.currentScene = sampleScene[0]
        return esm
    }
}
