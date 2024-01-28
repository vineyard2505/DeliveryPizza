//
//  ProductDetailView.swift
//  PizzaDelivery
//
//  Created by Екатерина Свиридо on 11.11.23.
//

import SwiftUI

struct ProductDetailView: View {
    
    var viewModel: ProductDetailViewModel
    @State var size = "Маленькая"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                
                Image("pizzaPH")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                HStack{
                    Text("\(viewModel.product.title)")
                        .font(.title2.bold())
                    Spacer()
                    Text("\(viewModel.getPrice(size: self.size)) $")
                        .font(.title2)
                }.padding(.horizontal)
                
                Text("\(viewModel.product.descript)")
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                
                HStack {
                    Stepper("Количество", value: $count, in: 1...10)
                    
                    Text("\(self.count)")
                        .padding(.leading, 32)
                    
                }.padding(.horizontal)
                
                Picker("Размер пиццы", selection: $size) {
                    ForEach(viewModel.sizes, id: \.self){ item in
                        Text(item)
                    }
                }.pickerStyle(.segmented)
                    .padding()
                
            }
            
            Button {
                var position = Position(id: UUID().uuidString , product: viewModel.product, count: self.count)
                
                position.product.price = viewModel.getPrice(size: size)
                
                CardViewModel.shared.addPosition(position)
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                Text("В корзину")
                    .padding()
                    .padding(.horizontal, 60)
                    .foregroundColor(.black)
                    .font(.title3.bold())
                    .background(LinearGradient(colors: [Color("yellow"), Color("orange")], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)
                    
            }

            Spacer()
        }
        
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "1", title: "Margarita", imageUrl: "Not found", price: 50, descript: "Самая дешевая пицца")
))
}
