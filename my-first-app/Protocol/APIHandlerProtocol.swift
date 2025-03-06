//
//  IAPIHandler.swift
//  my-first-app
//
//  Created by Paulo Tech on 29/05/24.
//

import Foundation

protocol APIHandlerProtocol {
    func get<T>(operation: @escaping () -> [T]) async -> [T]
    
    func getOne<T>(operation: @escaping () -> T) async -> T
}
