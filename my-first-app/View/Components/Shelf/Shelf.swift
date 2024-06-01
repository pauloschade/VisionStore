//
//  Shelf.swift
//  my-first-app
//
//  Created by Paulo Tech on 17/05/24.
//
import Foundation
import SwiftUI


struct ShelfView: View {
    let isVolumeWindowOpen: Bool
    @Binding var volumeItemPath: String
    
    @ObservedObject var eventState: EventStateManager
    @StateObject var sceneState: SceneStateManager = SceneStateManager()
    
    
    var body: some View {
        VStack{
            if let scene = sceneState.scene {
                SplitViewShelfView(isVolumeWindowOpen: isVolumeWindowOpen, volumeItemPath: $volumeItemPath, carriers: sceneState.carriers, scene: scene)
            }
            else {
                Text("Failed to load")
            }
        }
        .task{
            await fetchData()
        }
    }
    
    @MainActor
    func fetchData() async {
        if let scene = eventState.currentScene {
            sceneState.scene = scene
            sceneState.carriers = await AppController.shared.carriersController.getByScene(sceneId: scene.id)
        }
    }
}

struct ShelfView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a local state to bind to the isLongPressActive
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        let isVolumeWindowOpen: Bool = false
        @State var volumeItemPath: String = "AirForce"
        @StateObject var eventState: EventStateManager = EventStateManager.initMock()

        var body: some View {
            ShelfView(
                isVolumeWindowOpen: isVolumeWindowOpen, volumeItemPath: $volumeItemPath, eventState: eventState
            )
        }
    }
}
