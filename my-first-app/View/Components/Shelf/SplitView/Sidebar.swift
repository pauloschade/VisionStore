//
//  Sidebar.swift
//  my-first-app
//
//  Created by Paulo Tech on 17/05/24.
//

import Foundation
import SwiftUI

struct SidebarSplitViewShelfView: View {
    @Binding var carrier: CarrierModel?
    
    var body: some View {
        List(sampleCarrier, selection: $carrier) { it in
            CustomNavigationLinkView(text: it.text, value: it)
         }
    }
}
