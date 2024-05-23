//
//  Content.swift
//  my-first-app
//
//  Created by Paulo Tech on 17/05/24.
//

import Foundation
import SwiftUI

struct ContentSplitViewShelfView: View {
    @Binding var carrier: CarrierModel?
    @Binding var item: ItemModel?
    
    var body: some View {
        List(SampleItem.lebron, selection: $item) { (it) in
            if(it.carrierId == carrier?.id) {
                NavigationLink(it.text, value: it)
            }
         }
    }
}
