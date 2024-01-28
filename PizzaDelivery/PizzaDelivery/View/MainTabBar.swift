//
//  MainTabBar.swift
//  PizzaDelivery
//
//  Created by Екатерина Свиридо on 28.10.23.
//

import SwiftUI

struct MainTabBar: View {
    
    var viewModel: MainTabBarViewModel
    
    var body: some View {
        
        TabView {
            
            NavigationView {
                CatalogView()
            }
                .tabItem {
                    VStack{
                        Image(systemName: "menucard")
                        Text("Каталог")
                    }
                }
            
            CardView(viewModel: CardViewModel.shared)
                .tabItem {
                    VStack{
                        Image(systemName: "trash")
                        Text("Корзина")
                    }
                }
            
            ProfileView(viewModel: ProfileViewModel(profile: MWUser(id: "", name: "", phone: 0000000000, address: "")))
                .tabItem {
                    VStack{
                        Image(systemName: "person.circle")
                        Text("Профиль")
                    }
                }
            
        }
        
    }
}

 
