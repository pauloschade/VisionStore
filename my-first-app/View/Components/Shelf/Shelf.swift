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
    
    var body: some View {
        SplitViewShelfView(isVolumeWindowOpen: isVolumeWindowOpen, volumeItemPath: $volumeItemPath)
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

        var body: some View {
            ShelfView(
                isVolumeWindowOpen: isVolumeWindowOpen, volumeItemPath: $volumeItemPath
            )
        }
    }
}
