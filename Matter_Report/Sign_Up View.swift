//
//  Sign_Up View.swift
//  Matter_Report
//
//  Created by Victo-Jorge on 27/02/2025.
//

import SwiftUI
import Foundation
import Supabase

class SignUpViewModel: ObservableObject{
    @Published var email = ""
    @Published var emailErrorMessage: String = ""
    @Published var password = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    
    private let client = SupabaseManager.shared.supabase
    
    // Validate email format
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if emailTest.evaluate(with: email) {
            emailErrorMessage = ""
            return true
        } else {
            emailErrorMessage = "Invalid email format"
            return false
        }
    }
    
    // Validate password strength
    func isPasswordAccepted() -> Bool {
        
        
        let passwordRegex = "(?=.*[A-Z])(?=.*[0-9]).{9,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: password)
    }
    
    // Sign up user with Supabase
    func signUp() async -> Bool {
        guard isValidEmail(), isPasswordAccepted() else {
            errorMessage = "Please check your email and password."
            return false
        }
        
        do {
            let response = try await client.auth.signUp(email: email, password: password)
            if response.user != nil {
                DispatchQueue.main.async {
                    self.isLoggedIn = true
                }
                return true
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
        return false
    }
    
    // Sign in user with Supabase
    // Sign in user with Supabase
    func signIn() async -> Bool {
        guard !email.isEmpty && !password.isEmpty else {
            errorMessage = "Email and password cannot be empty."
            return false
        }

        do {
            // Sign in using Supabase Auth (direct response is the session)
            let session = try await client.auth.signIn(email: email, password: password)
            
            // Check if session is successfully created
            if session != nil {
                DispatchQueue.main.async {
                    self.isLoggedIn = true
                }
                return true
            } else {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to sign in, please try again."
                }
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
        return false
    }
}
