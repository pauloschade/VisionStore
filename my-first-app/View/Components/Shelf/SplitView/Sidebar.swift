//
//  Sidebar.swift
//  my-first-app
//
//  Created by Paulo Tech on 17/05/24.
//

import Foundation
import SwiftUI

struct SidebarSplitViewShelfView: View {
    @Binding var selectedCarrier: CarrierModel?
    let carriers: [CarrierModel]
    
    var body: some View {
        List(carriers, selection: $selectedCarrier) { carrier in
            CustomNavigationLinkView(text: carrier.text, value: carrier)
         }
    }
}
