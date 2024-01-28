//
//  ProductCell.swift
//  PizzaDelivery
//
//  Created by Екатерина Свиридо on 9.11.23.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    var body: some View {
        
        VStack(spacing: 2) {
            Image("pizzaPH")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                .cornerRadius(16)
            
            
            HStack{
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 12))
                Spacer()
                Text("\(product.price) $")
                    .font(.custom("AvenirNext-bold", size: 12))
            }
            .padding(.horizontal, 6)
            .padding(.bottom, 6)
        }.frame(width: screen.width * 0.45, height: screen.width * 0.55)
            .background(.white)
            .cornerRadius(16)
            .shadow(radius: 4)
    }
}

#Preview {
    ProductCell(product: Product(id: "1", title: "Margarita", imageUrl: "Not found", price: 450, descript: "Самая дешевая пицца"))
}
