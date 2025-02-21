//
//  Player.swift
//  my-first-app
//
//  Created by Paulo Tech on 17/05/24.
//
import SwiftUI

struct PlayerView: View {
    let shelfID: String
    @ObservedObject var eventState: EventStateManager
    @State var currentTimeSeconds: Int = 0
    

    var body: some View {
        VStack {
            if (eventState.event?.id) != nil {
                GeometryReader { geometry in
                    ZStack {
                        VideoPlayerView(eventUrl: "tony_stark_car" , currentTimeSeconds: $currentTimeSeconds)
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
            } else {
                Text("Loading...")
            }
        }
        .task {
            await fetchData()
        }
        .onChange(of: currentTimeSeconds) {
            if let eventId = self.eventState.event?.id {
                Task {
                    self.eventState.currentScene = await AppController.shared.scenesController.getCurrentByEvent(eventId: eventId, currentTimeSeconds: currentTimeSeconds)
                }
            }
        }
    }

    @MainActor
    func fetchData() async {
        self.eventState.event = await AppController.shared.eventsController.get()[1]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
    }
    private struct PreviewView: View {
        @StateObject private var eventState = EventStateManager()
        var body: some View {
            PlayerView(shelfID: "shelf1", eventState: eventState)
        }
    }
}
