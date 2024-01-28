//
//  ProfileView.swift
//  PizzaDelivery
//
//  Created by Екатерина Свиридо on 28.10.23.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented = false
    @State var isAvaQuitPresented = false
    @State var isAuthViewPresented = false
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        
        VStack(alignment: .center, spacing: 20) {
            HStack(spacing: 16){
                Image("user")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(4)
                    .background(Color("lightGray"))
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }
                    .confirmationDialog("Откуда взять фотку?", isPresented: $isAvaAlertPresented) {
                        Button {
                            print("Library")
                        } label: {
                            Text("Из галереи")
                        }
                        
                        Button {
                            print("Camera")
                        } label: {
                            Text("С камеры")
                        }

                    }
                
                VStack (alignment: .leading, spacing: 10) {
                    TextField("Имя", text: $viewModel.profile.name)
                        .font(.body.bold())
                    HStack {
                        Text("+375")
                        TextField("Телефон", value: $viewModel.profile.phone, format: .number)
                    }
                }
            }.padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 8){
                Text("Адрес доставки:")
                    .bold()
                TextField("Ваш адрес", text: $viewModel.profile.address)
            }.padding(.horizontal)
            
            // таблица с заказами
            List {
                if viewModel.orders.count == 0 {
                    Text("Ваши заказы будут тут!")
                } else {
                    ForEach(viewModel.orders, id: \.id) { order in
                        OrderCell(order: order)
                    }
                }
            }.listStyle(.plain)
            
            Button {
                isAvaQuitPresented.toggle()
            } label: {
                Text("Выйти")
                    .bold()
                    .padding()
                    .padding(.horizontal, 40)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(25)
                    
                
            }.padding()
                .confirmationDialog("Точно покинуть аккаунт?", isPresented: $isAvaQuitPresented) {
                    Button {
                        isAuthViewPresented.toggle()
                    } label: {
                        Text("Да")
                    }

                }
            
            
                .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                    AuthView()
                }
            
        }
        .onSubmit {
            viewModel.setProfile()
        }
        .onAppear {
            self.viewModel.getProfile()
            self.viewModel.getOrders()
        }
        
        
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(profile: MWUser(id: "", name: "Татьяна Виноградова", phone: 333351322, address: "г. Новополоцк")))
}
