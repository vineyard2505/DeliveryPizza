//
//  MainTabBarViewModel.swift
//  PizzaDelivery
//
//  Created by Екатерина Свиридо on 8.12.23.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
}
