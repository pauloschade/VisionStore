//
//  SplitView.swift
//  my-first-app
//
//  Created by Paulo Tech on 21/05/24.
//

import Foundation
import SwiftUI

struct SplitViewShelfView: View {
    @State private var carrier: CarrierModel?
    @State private var item: ItemModel?
    @State private var columnVisibility = NavigationSplitViewVisibility.automatic
    
    let isVolumeWindowOpen: Bool
    @Binding var volumeItemPath: String
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        NavigationSplitView() {
            SidebarSplitViewShelfView(carrier: $carrier)
            .navigationTitle("Carrier")
        } content: {
            ContentSplitViewShelfView(carrier: $carrier, item: $item)
            .navigationTitle("Item")
        } detail: {
            DetailSplitViewShelfView(filePath3D: item?.filePath3D, isVolumeWindowOpen: isVolumeWindowOpen, volumeItemPath: $volumeItemPath)
            .navigationTitle("Detail")
        }
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
            SplitViewShelfView(isVolumeWindowOpen: isVolumeWindowOpen, volumeItemPath: $volumeItemPath)
        }
    }
}
