//
//  CatalogViewModel.swift
//  PizzaDelivery
//
//  Created by Екатерина Свиридо on 11.11.23.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var popularProducts = [
        Product(id: "1", title: "Margarita", imageUrl: "Not found", price: 50, descript: "Самая дешевая пицца"),
        Product(id: "2", title: "Homemade", imageUrl: "Not found", price: 60, descript: "Самая дешевая пицца"),
        Product(id: "3", title: "Lesnaya", imageUrl: "Not found", price: 70, descript: "Самая дешевая пицца"),
        Product(id: "4", title: "Pepperoni", imageUrl: "Not found", price: 30, descript: "Самая дешевая пицца"),
        Product(id: "5", title: "Gavaiskaya", imageUrl: "Not found", price: 80, descript: "Самая дешевая пицца")
    
    ]
    
    var pizza = [
        Product(id: "1", title: "Margarita", imageUrl: "Not found", price: 50, descript: "Самая дешевая пицца"),
        Product(id: "2", title: "Homemade", imageUrl: "Not found", price: 60, descript: "Самая дешевая пицца"),
        Product(id: "3", title: "Lesnaya", imageUrl: "Not found", price: 70, descript: "Самая дешевая пицца"),
        Product(id: "4", title: "Pepperoni", imageUrl: "Not found", price: 30, descript: "Самая дешевая пицца"),
        Product(id: "5", title: "Gavaiskaya", imageUrl: "Not found", price: 80, descript: "Самая дешевая пицца")
    
    ]
    
}
