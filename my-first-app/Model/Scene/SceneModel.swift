//
//  Scene.swift
//  my-first-app
//
//  Created by Paulo Tech on 28/05/24.
//
import Foundation

struct SceneModel: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let eventId: String
    let text: String
    let startTimeSeconds: Int
}
