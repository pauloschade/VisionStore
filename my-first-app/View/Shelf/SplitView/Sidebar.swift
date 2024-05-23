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
        List(SampleCarrier.lebron, selection: $carrier) { it in
             NavigationLink(it.text, value: it)
         }
    }
}
