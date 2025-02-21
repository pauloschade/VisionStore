//
//  my_first_appApp.swift
//  my-first-app
//
//  Created by Paulo Tech on 14/05/24.
//

import SwiftUI

@main
struct my_first_appApp: App {
    private let shelfID: String = "shelf"
    @State var volumeItemPath: String = "AirForce"
    @State private var isVolumeWindowOpen: Bool = false
    
    @StateObject private var eventState = EventStateManager()
    
    var body: some Scene {
        WindowGroup (id: "player") {
            PlayerView(shelfID: shelfID, eventState: eventState)
        }
        
        WindowGroup(id: shelfID) {
            ShelfView(isVolumeWindowOpen: isVolumeWindowOpen, volumeItemPath: $volumeItemPath, eventState: eventState)
        }
        
        WindowGroup(id: "volume") {
            VolumeItemView(path: volumeItemPath)
                .onAppear{isVolumeWindowOpen = true}
                .onDisappear{isVolumeWindowOpen = false}
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 2, height: 2, depth: 2, in: .meters)
    }
}
