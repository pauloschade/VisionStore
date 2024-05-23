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
            DetailSplitViewShelfView(filePath3D: item?.filePath3D, isVolumeWindowOpen: isVolumeWindowOpen)
            .navigationTitle("Detail")
        }
    }
}
