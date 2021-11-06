//
//  Order.swift
//  NestedObject-Example
//
//  Created by Kürşat Şimşek on 5.11.2021.
//

import Foundation

struct Order: Codable, Identifiable {
    var id: Int = 0
    var shipName: String = ""
    var shipAddress: ShipAddress?
}
