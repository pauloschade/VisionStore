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
    
    var body: some View {
        ItemView(filePath3D: filePath3D, isVolumeWindowOpen: isVolumeWindowOpen)
    }
}

#Preview {
    DetailSplitViewShelfView(filePath3D: "AirForce", isVolumeWindowOpen: false)
}
