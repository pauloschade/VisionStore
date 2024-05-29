//
//  Event.swift
//  my-first-app
//
//  Created by Paulo Tech on 28/05/24.
//

import Foundation

struct EventModel: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let title: String
}
