//
//  OrderCell.swift
//  PizzaDelivery
//
//  Created by Екатерина Свиридо on 13.12.23.
//

import SwiftUI

struct OrderCell: View {
    
    var order: Order
    
    var body: some View {
        
        HStack{
            Text("\(order.date)")
            Text("\(order.status)")
                .frame(width: 100)
                .foregroundColor(.green)
        }
    }
}

//#Preview {
//    OrderCell()
//}
