//
//  SplitView.swift
//  my-first-app
//
//  Created by Paulo Tech on 21/05/24.
//

import Foundation
import SwiftUI

struct SplitViewShelfView: View {
    let isVolumeWindowOpen: Bool
    @Binding var volumeItemPath: String
    let carriers: [CarrierModel]
    let scene: SceneModel
    
    @StateObject var carrierSceneState: CarrierSceneStateManager = CarrierSceneStateManager()
    @State private var selectedCarrier: CarrierModel? = nil
    @State private var selectedItem: ItemModel? = nil
    @State private var loadingItems: Bool = false
    
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        NavigationSplitView() {
            SidebarSplitViewShelfView(selectedCarrier: $selectedCarrier, carriers: carriers)
            .navigationTitle("Carrier")
        } content: {
            if(loadingItems) {
                ProgressView()
            } else {
                ContentSplitViewShelfView(selectedItem: $selectedItem, items: carrierSceneState.items)
                    .navigationTitle("Item")
            }
        } detail: {
            if let item = selectedItem {
                DetailSplitViewShelfView(filePath3D: item.filePath3D, isVolumeWindowOpen: isVolumeWindowOpen, volumeItemPath: $volumeItemPath)
                .navigationTitle("Detail")
            } else {
                Text("Select an Item to view")
            }
        }
        .onChange(of: selectedCarrier) {
            Task {
                await fetchData()
            }
        }

    }
    
    @MainActor
    func fetchData() async {
        loadingItems = true
        if let carrier = selectedCarrier {
            carrierSceneState.carrier = carrier
            carrierSceneState.scene = scene
            carrierSceneState.items = await AppController.shared.itemsController.getByCarrierAndScene(carrierId: carrier.id, sceneId: scene.id)
        }
        loadingItems = false
        
    }
}

struct SplitViewShelfView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a local state to bind to the isLongPressActive
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        let isVolumeWindowOpen: Bool = false
        @State var volumeItemPath: String = "AirForce"

        var body: some View {
            SplitViewShelfView(isVolumeWindowOpen: isVolumeWindowOpen, volumeItemPath: $volumeItemPath, carriers: sampleCarrier, scene: sampleScene[0])
        }
    }
}
