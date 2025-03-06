//
//  ScenesServiceProtocol.swift
//  my-first-app
//
//  Created by Paulo Tech on 29/05/24.
//

import Foundation

protocol ScenesServiceProtocol {
    func getByEvent(eventId: String) -> [SceneModel]
    func getCurrentByEvent(eventId: String, currentTimeSeconds: Int) -> SceneModel?
}

