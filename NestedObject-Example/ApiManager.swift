//
//  ApiManager.swift
//  NestedObject-Example
//
//  Created by Kürşat Şimşek on 5.11.2021.
//

import Foundation
import SwiftUI

class ApiManager: ObservableObject {
    let baseURL = URL(string: "https://northwind.vercel.app/api/orders")
    @Published var orders : [Order] = [Order]()
    @Published var order : Order = Order()
    
    func getOrders() -> [Order] {
        
        guard let url = baseURL else { return getOrders() }
       
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if let data = data {
                    let decodedData = try JSONDecoder().decode([Order].self, from: data)
                    DispatchQueue.main.async {
                        self.orders = decodedData
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
        
        return self.orders
    }
    
    func getOrderById(orderId: Int) -> Order {
        
        guard let url = URL(string: "https://northwind.vercel.app/api/orders/" + String(orderId)) else { return getOrderById(orderId: 0) }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if let data = data {
                    let decodedData = try JSONDecoder().decode(Order.self, from: data)
                    DispatchQueue.main.async {
                        self.order = decodedData
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
        
        return self.order
    }
    
    
}
