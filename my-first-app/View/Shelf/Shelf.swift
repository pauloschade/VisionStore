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
    
    var body: some View {
        SplitViewShelfView(isVolumeWindowOpen: isVolumeWindowOpen)
    }
}

#Preview {
    ShelfView(isVolumeWindowOpen: false)
}
