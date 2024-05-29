//
//  Detail.swift
//  my-first-app
//
//  Created by Paulo Tech on 17/05/24.
//

import Foundation
import SwiftUI

struct DetailSplitViewShelfView: View {
    
    let filePath3D: String?
    
    let isVolumeWindowOpen: Bool
    
    @Binding var volumeItemPath: String
    
    var body: some View {
        ItemView(filePath3D: filePath3D, isVolumeWindowOpen: isVolumeWindowOpen, volumeItemPath: $volumeItemPath)
    }
}

struct DetailSplitViewShelfView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a local state to bind to the isLongPressActive
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        let isVolumeWindowOpen: Bool = false
        @State var volumeItemPath: String = "AirForce"

        var body: some View {
            DetailSplitViewShelfView(filePath3D: volumeItemPath, isVolumeWindowOpen: isVolumeWindowOpen, volumeItemPath: $volumeItemPath)
        }
    }
}
