//
//  SampleScene.swift
//  my-first-app
//
//  Created by Paulo Tech on 28/05/24.
//
let sampleScene: [SceneModel] = [
    // Lebron dunk
    SceneModel(eventId: sampleEvent[0].id ,text: "dunk", startTimeSeconds: 5),
    SceneModel(eventId: sampleEvent[0].id, text: "turnover", startTimeSeconds: 0),
    
    // Tony Stark Car (Avengers)
    SceneModel(eventId: sampleEvent[1].id, text: "Steve + Tony talk", startTimeSeconds: 0), /// 2
    SceneModel(eventId: sampleEvent[1].id, text: "Scott tacos + rocket's ship", startTimeSeconds: 141),  /// 3
]
