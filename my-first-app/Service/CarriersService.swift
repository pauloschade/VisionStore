//
//  CarrierAPI.swift
//  my-first-app
//
//  Created by Paulo Tech on 28/05/24.
//
import Foundation

class CarriersService: CarriersServiceProtocol {
    func getByScene(sceneId: String) -> [CarrierModel] {
        let carrierIds = sampleCarrierScene
            .filter { $0.sceneId == sceneId }
            .map { $0.carrierId }
        
        return sampleCarrier.filter { carrierIds.contains($0.id) }
    }
}
