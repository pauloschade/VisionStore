//
//  VideoPlayer.swift
//  my-first-app
//
//  Created by Paulo Tech on 17/05/24.
//
import Foundation
import SwiftUI
import AVKit


struct VideoPlayerView: View {
    @State var player: AVPlayer? = nil
    @State var isPlaying: Bool = false
    @Binding var eventId: String
    @Binding var currentTimeSeconds: Int
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            if let player = player {
                VideoPlayer(player: player)
                    .onAppear {
                        player.play()
                        isPlaying = true
                    }

                Button {
                    if isPlaying {
                        player.pause()
                    } else {
                        player.play()
                    }
                    isPlaying.toggle()
                    player.seek(to: .zero)
                } label: {
                    Image(systemName: isPlaying ? "stop" : "play")
                        .padding()
                }
            } else {
                Text("Video not found")
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            if let url = Bundle.main.url(forResource: "Lebron_dunk", withExtension: "mp4") {
                player = AVPlayer(url: url)
            }
        }
        .onReceive(timer) { _ in
            if(!isPlayerPlaying()) { return }
            if let currentTime = player?.currentItem?.currentTime() {
                currentTimeSeconds = Int(CMTimeGetSeconds(currentTime))
            } else {
                currentTimeSeconds = 0
            }
        }
        .onDisappear {
            timer.upstream.connect().cancel()
        }
    }
    func isPlayerPlaying() -> Bool {
        return player?.rate != 0 && player?.error == nil
    }
}
