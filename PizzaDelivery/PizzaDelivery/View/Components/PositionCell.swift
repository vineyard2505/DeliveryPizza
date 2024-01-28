//
//  PositionCell.swift
//  PizzaDelivery
//
//  Created by Екатерина Свиридо on 13.11.23.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) шт.")
            
            Text("\(position.cost) $")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal)
    }
}

#Preview {
    PositionCell(position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString, title: "Margarita", imageUrl: "pizzaPH", price: 30, descript: "Вкусная пицца"), count: 3))
}
//product.price
