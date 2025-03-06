//
//  EventsServiceProtocol.swift
//  my-first-app
//
//  Created by Paulo Tech on 29/05/24.
//

import Foundation

protocol EventsServiceProtocol {
    func get() -> [EventModel]
}
