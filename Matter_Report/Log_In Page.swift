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
    @State private var showPassword: Bool = false
    @State private var MainPage: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                VStack{
                  
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
                        
                }
                TextField("Enter your email address", text: $viewModel.email)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 2)
                    }
                    .padding()
                
                ZStack {
                    Group {
                        if showPassword {
                            TextField("Enter your password", text: $viewModel.password, prompt: Text("Password").foregroundColor(.gray))
                        } else {
                            SecureField("Enter your password", text: $viewModel.password,
                                        prompt: Text("Password").foregroundColor(.gray))
                        }
                    }
                    .padding()
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
            
                
                Button("Log In") {
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
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
                
                Spacer()
                
                NavigationLink(destination: Sign_up()) {
                    Text("Do not have an account? Sign Up.")
                        .font(.title3)
                        .font(.custom("Georgia", size: 20))
                        .bold()
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            
            .alert("Welcome", isPresented: $presentAlert) {
                Button("OK", role: .cancel) {
                    navigateToProfile = true
                }
                
            }
            NavigationLink(destination: Matter_Report.MainPage(),isActive: $navigateToProfile){
                EmptyView()
            }
            .background(Color.gray)
        }
    }
}



#Preview {
    Login(viewModel: SignUpViewModel())
}
