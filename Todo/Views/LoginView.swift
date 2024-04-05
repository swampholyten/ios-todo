//
//  LoginView.swift
//  Todo
//
//  Created by junkai ji on 04/04/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        
        VStack {
        
            //            Header
            HeaderView(title: "To Do List",
                       subTitle: "Get things done",
                       angle: 15,
                       background: .pink)
            
            
            Form {
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Log In",
                    background: .blue
                ) {
                    viewModel.login()
                }
                .padding()
            }
            .offset(y: -50)
            
            
            //            Create Account
            
            VStack {
                Text("New around here?")
                
                NavigationLink("Create An Account", destination: RegisterView())
            }
            .padding(.bottom, 50)
            
            
            Spacer()
        }
    
    }
}

#Preview {
    LoginView()
}
