//
//  CarrierScene.swift
//  my-first-app
//
//  Created by Paulo Tech on 28/05/24.
//
import Foundation

struct CarrierSceneModel: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let carrierId: String
    let sceneId: String
}
