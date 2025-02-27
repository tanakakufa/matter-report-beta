//
//  Sign_up2.swift
//  Matter_Report
//
//  Created by Victo-Jorge on 27/02/2025.
//

import SwiftUI

struct Sign_up: View {
    @StateObject var viewModel = SignUpViewModel()
    @State private var presentAlert: Bool = false
    @State private var passwordNotConfirmedAlert: Bool = false
    @State private var navigateToLogin: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Matter Report")
                        .font(.custom("Georgia", size: 38.9))
                        .fontWeight(.semibold)
                    
                }
       
                
                    
                Spacer()

                VStack {
                    Spacer()
                    Spacer()

                    HStack {
                        Text("Sign Up")
                            .font(.custom("Codec Pro", size: 47.3))
                            .padding()
                        Spacer()
                    }

                    TextField("Enter your email address", text: $viewModel.email)
                        .padding()
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .background(Color.gray)
                        .cornerRadius(15)
                        .shadow(radius: 2)
                        .padding()

                    if !viewModel.emailErrorMessage.isEmpty {
                        Text(viewModel.emailErrorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.top, 5)
                    }

                    TextField("Enter your password", text: $viewModel.password)
                        .padding()
                        .autocapitalization(.none)
                        .background(Color.gray)
                        .cornerRadius(15)
                        .shadow(radius: 2)
                        .padding()

                    Button("Next") {
                        Task {
                            if viewModel.isPasswordAccepted() && viewModel.isValidEmail() {
                                let success = await viewModel.signUp()
                                if success {
                                    presentAlert = true
                                } else {
                                    passwordNotConfirmedAlert = true
                                }
                            } else if !viewModel.isPasswordAccepted() {
                                passwordNotConfirmedAlert = true
                            }
                            
                        }
                    }
                    .padding()
                    .cornerRadius(40)
                    .border(.white)
                    .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)
                    .alert("Welcome", isPresented: $presentAlert) {
                        Button("Ok") {
                            navigateToLogin = true
                        }
                    }
                    .alert("Password should contain at least 9 characters, a number, and an uppercase letter.", isPresented: $passwordNotConfirmedAlert) {}

                    NavigationLink(destination: Login(viewModel: SignUpViewModel()), isActive: $navigateToLogin) {
                        EmptyView()
                    }

                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.white)

                        NavigationLink(destination: Login(viewModel: SignUpViewModel())) {
                            Text("Sign In")
                                .font(.title3)
                                .font(.custom("Georgia", size: 20))
                                .bold()
                        }
                        
                    }
                }

                Spacer()
            }
          
        }
    }
}

#Preview {
    Sign_up()
}
