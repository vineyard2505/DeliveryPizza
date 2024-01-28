//
//  CardView.swift
//  PizzaDelivery
//
//  Created by Екатерина Свиридо on 28.10.23.
//

import SwiftUI

struct CardView: View {
    
    @StateObject var viewModel: CardViewModel
    
    var body: some View {
        
        VStack {
            List(viewModel.positions) { position in
                PositionCell(position: position)
                    .swipeActions{
                        Button {
                            viewModel.positions.removeAll { pos in
                                pos.id == position.id
                            }
                        } label: {
                            Text("Удалить")
                        }.tint(.red)

                    }
            }
            .listStyle(.plain)
        .navigationTitle("Корзина")
            
            HStack {
                Text("ИТОГО:")
                    .fontWeight(.bold)
                Spacer()
                Text("\(self.viewModel.cost) $")
                    .fontWeight(.bold)
            }.padding()
            
            HStack(spacing: 24) {
                
                Button {
                    print("Отменить")
                } label: {
                    Text("Отменить")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(24)
                }
                
                Button {
                    print("Заказать")
                    
                    var order = Order(userID: AuthService.shared.currentUser!.uid, date: Date(), status: OrderStatus.new.rawValue)
                    
                    order.positions = self.viewModel.positions
                    
                    DatabaseService.shared.setOrder(order: order) { result in
                        switch result {
                            
                        case .success(let order):
                            print(order.cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    
                } label: {
                    Text("Заказать")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(24)
                }

            }.padding()
        }
         
        
    }
}

#Preview {
    CardView(viewModel: CardViewModel.shared)
}
