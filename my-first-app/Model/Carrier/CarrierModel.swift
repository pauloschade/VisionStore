//
//  CarrierModel.swift
//  my-first-app
//
//  Created by Paulo Tech on 17/05/24.
//

import Foundation

struct CarrierModel: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let text: String
}
