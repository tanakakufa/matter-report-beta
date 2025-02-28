//
//  App_View.swift
//  Matter_Report
//
//  Created by Victo-Jorge on 27/02/2025.
//

import SwiftUI

import Foundation

struct AppView: View {
  @State var isAuthenticated = false

  var body: some View {
    Group {
      if isAuthenticated {
          MainPage()
      } else {
        AuthView()
      }
    }
    .task {
      for await state in supabase.auth.authStateChanges {
        if [.initialSession, .signedIn, .signedOut].contains(state.event) {
          isAuthenticated = state.session != nil
        }
      }
    }
  }
}
