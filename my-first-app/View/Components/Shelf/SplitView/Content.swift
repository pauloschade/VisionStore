//
//  Content.swift
//  my-first-app
//
//  Created by Paulo Tech on 17/05/24.
//

import Foundation
import SwiftUI

struct ContentSplitViewShelfView: View {
    @Binding var selectedItem: ItemModel?
    var items: [ItemModel]
    
    var body: some View {
        List(items, selection: $selectedItem) { (item) in
//            if(it.carrierId == carrier?.id) {
//                NavigationLink(it.text, value: it)
//            }
            NavigationLink(item.text, value: item)
         }
    }
}
