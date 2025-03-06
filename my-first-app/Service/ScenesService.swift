//
//  SceneAPI.swift
//  my-first-app
//
//  Created by Paulo Tech on 28/05/24.
//

import Foundation

class ScenesService: ScenesServiceProtocol {
    func getByEvent(eventId: String) -> [SceneModel] {
        return sampleScene.filter { $0.eventId == eventId }
    }
    
    func getCurrentByEvent(eventId: String, currentTimeSeconds: Int) -> SceneModel? {
        return self.getByEvent(eventId: eventId)
            .filter { $0.startTimeSeconds < currentTimeSeconds }
            .sorted { $0.startTimeSeconds < $1.startTimeSeconds }
            .last
    }
}
