//
//  CarrierSceneItem.swift
//  my-first-app
//
//  Created by Paulo Tech on 28/05/24.
//

import Foundation

struct CarrierSceneItem: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let carrierSceneId: String
    let itemId: String
}
