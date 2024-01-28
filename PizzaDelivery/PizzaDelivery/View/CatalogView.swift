//
//  Catalog.swift
//  PizzaDelivery
//
//  Created by Екатерина Свиридо on 28.10.23.
//

import SwiftUI

struct CatalogView: View {
    
    let layoutForPopular = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    let layoutForPizza = [GridItem(.adaptive(minimum: screen.width / 2.4))]

    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            Section("Популярное") {
                
                ScrollView (.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layoutForPopular, spacing: 16) {
                        ForEach(CatalogViewModel.shared.popularProducts,id: \.id) { item in
                            
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                        }
                    }.padding()
                }
            }
            
            
            Section("Пицца") {
                
                ScrollView (.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layoutForPizza, spacing: 16) {
                        ForEach(CatalogViewModel.shared.popularProducts,id: \.id) { item in
                            
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                            
                        }
                    }.padding()
                }
            }
            
        }.navigationTitle(Text("Каталог"))
    }
}

#Preview {
    CatalogView()
}
