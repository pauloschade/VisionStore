//
//  ItemModel.swift
//  my-first-app
//
//  Created by Paulo Tech on 17/05/24.
//

import Foundation

struct ItemModel: Identifiable, Hashable {
    let id = UUID()
    let text: String
    let carrierId: UUID
    let filePath3D: String
}
