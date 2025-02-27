//
//  Log_In Page.swift
//  Matter_Report
//
//  Created by Victo-Jorge on 27/02/2025.
//

import SwiftUI

struct Login: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var presentAlert: Bool = false
    @State private var errorMessage: String = ""
    @State private var navigateToProfile: Bool = false

    var body: some View {
        VStack {
        
            Text("Matter report")
                .font(.custom("Georgia", size: 38.9))
                .fontWeight(.semibold)
            
           
            }
        
        
            
        VStack {
            TextField("Enter your email address", text: $viewModel.email)
                .padding()
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .background(Color.gray)
                .cornerRadius(15)
                .shadow(radius: 2)
                .padding()

            SecureField("Enter your password", text: $viewModel.password)
                .padding()
                .autocapitalization(.none)
                .background(Color.gray)
                .cornerRadius(15)
                .shadow(radius: 2)
                .padding()

            Button("Login") {
                Task {
                    let success = await viewModel.signIn()
                    if success {
                        presentAlert = true
                    } else {
                        errorMessage = viewModel.errorMessage
                    }
                }
            }
            .padding()
            .background(Color(.blue))
            .cornerRadius(20)
            .border(.white)
            .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top, 10)
            }

            Spacer()
        }
    
        .alert("Welcome", isPresented: $presentAlert) {
            Button("OK", role: .cancel) {
                navigateToProfile = true
            }
            
        }
        NavigationLink(destination: ProfileView(),isActive: $navigateToProfile){
            EmptyView()
        }
    }
}


#Preview {
    Login(viewModel: SignUpViewModel())
}
