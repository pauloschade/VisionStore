//
//  ItemsServiceProtocol.swift
//  my-first-app
//
//  Created by Paulo Tech on 29/05/24.
//

import Foundation

protocol ItemsServiceProtocol {
    func getByCarrierAndScene(carrierId: String, sceneId: String) -> [ItemModel]
}
