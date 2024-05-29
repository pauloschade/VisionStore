//
//  Player.swift
//  my-first-app
//
//  Created by Paulo Tech on 17/05/24.
//

import Foundation

import SwiftUI

struct PlayerView: View {
    let shelfID: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VideoPlayerView()
                    .frame(width: geometry.size.width, height: geometry.size.height)

                VStack {
                    HStack {
                        ManageButtonsView(windowID: shelfID)
                            .padding()
                        Spacer()
                    }
                    Spacer()
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
