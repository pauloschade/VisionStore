//
//  APIMockRequest.swift
//  my-first-app
//
//  Created by Paulo Tech on 29/05/24.
//

import Foundation

import Foundation

class APIHandlerMock: APIHandlerProtocol {
    func get<T>(operation: @escaping () -> [T]) async -> [T] {
        return await withCheckedContinuation { continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                let result = operation()
                continuation.resume(returning: result)
            }
        }
    }
    
    func getOne<T>(operation: @escaping () -> T) async -> T {
        return await withCheckedContinuation { continuation in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0) {
                let result = operation()
                continuation.resume(returning: result)
            }
        }
    }
}
