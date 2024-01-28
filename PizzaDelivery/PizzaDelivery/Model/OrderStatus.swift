//
//  OrderStatus.swift
//  PizzaDelivery
//
//  Created by Екатерина Свиридо on 13.12.23.
//

import Foundation


enum OrderStatus: String {
    
    case new = "Новый"
    case cooking = "Готовится"
    case delivery = "Доставляется"
    case completed = "Выполнен"
    case cancelled = "Отменен"
    
}
