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
    @State private var showPassword: Bool = false

    var body: some View {
        
        NavigationView {
            VStack {
                VStack{
                    Spacer()
                    Image("MatterLogo")
                        .resizable()
                        .frame(width: 220, height: 200)
                        .overlay{
                            Circle()
                                .stroke(.white , lineWidth: 4)
                                .shadow(radius: 10)
                                .frame(width: 250, height: 225)
                        }
                        .frame(width: 200, height: 200)
                        .padding()
                    Spacer()
                }

                VStack {
                    
                    TextField("Enter your email address", text: $viewModel.email)
                        .padding(10)
                                              .overlay {
                                                  RoundedRectangle(cornerRadius: 10)
                                                      .stroke(.blue, lineWidth: 2)
                                              }
                                              .padding()

                    if !viewModel.emailErrorMessage.isEmpty {
                        Text(viewModel.emailErrorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.top, 5)
                    }

                    ZStack {
                        Group {
                            
                            if showPassword {
                                TextField("Enter your password", text: $viewModel.password, prompt: Text("Password").foregroundColor(.gray))
                            } else {
                                SecureField("Enter your password", text: $viewModel.password,
                                            prompt: Text("Password").foregroundColor(.gray))
                            }
                        }
                                .padding(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.blue, lineWidth: 2)
                                }
                                .padding()
                            
                            HStack {
                                Spacer()
                                Button {
                                    showPassword.toggle()
                                } label: {
                                    Image(systemName: showPassword ? "key.slash" : "key")
                                        .foregroundColor(.black)
                                }
                                .padding(25)                      }
                        
                    }

                    Button("Sign Up") {
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
                    .font(.title2)
                                       .bold()
                                       .foregroundColor(.white)
                    .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(
                                    Color.gray
                                )
                                .cornerRadius(20).padding()
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

                        NavigationLink(destination: Login(viewModel: SignUpViewModel())) {
                            Text("Already have an account? Log In")
                                .font(.title3)
                                .font(.custom("Georgia", size: 20))
                                .bold()
                        }
                        Spacer()
                        
                    
                }

                Spacer()
                Spacer()
                Spacer()
            }
          
        }
    } 
}

#Preview {
    Sign_up()
}
