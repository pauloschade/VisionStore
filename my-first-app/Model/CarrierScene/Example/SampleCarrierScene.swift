//
//  SampleCarrierScene.swift
//  my-first-app
//
//  Created by Paulo Tech on 28/05/24.
//
let sampleCarrierScene: [CarrierSceneModel] = [
    // Lebron Dunk
    /// scene 1
    CarrierSceneModel(carrierId: sampleCarrier[0].id, sceneId: sampleScene[0].id),
    CarrierSceneModel(carrierId: sampleCarrier[0].id, sceneId: sampleScene[1].id),
    /// scene 2
    CarrierSceneModel(carrierId: sampleCarrier[1].id, sceneId: sampleScene[0].id),
    CarrierSceneModel(carrierId: sampleCarrier[1].id, sceneId: sampleScene[1].id),
    
    // Tony Stark Car (Avengers)
    /// scene 1 ( steve, tony)
    CarrierSceneModel(carrierId: sampleCarrier[2].id, sceneId: sampleScene[2].id), /// 4
    CarrierSceneModel(carrierId: sampleCarrier[3].id, sceneId: sampleScene[2].id), /// 5
    /// scene 2 (scott, nebula, hulk)
    CarrierSceneModel(carrierId: sampleCarrier[4].id, sceneId: sampleScene[3].id), /// 6
    CarrierSceneModel(carrierId: sampleCarrier[5].id, sceneId: sampleScene[3].id), /// 7
    CarrierSceneModel(carrierId: sampleCarrier[6].id, sceneId: sampleScene[3].id), /// 8
]
