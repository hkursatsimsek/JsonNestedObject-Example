//
//  ContentView.swift
//  NestedObject-Example
//
//  Created by Kürşat Şimşek on 5.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fetchedData = ApiManager()
    
    var body: some View {
        NavigationView{

            List(fetchedData.getOrders()){ order in

                NavigationLink(

                    destination: AddressView(id: order.id),
                    label: {
                        Text(order.shipName)
                    }
                )
                .navigationTitle("Order List")
                .navigationBarTitleDisplayMode(.inline)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AddressView: View {
    
    @ObservedObject var orderData = ApiManager()
    var orderId = 0
    
    init(id:Int) {
        self.orderId = id
    }
    
    var body: some View {
        Text(orderData.getOrderById(orderId: orderId).shipName)
    }
}
