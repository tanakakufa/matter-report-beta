//
//  ReportMainLayout.swift
//  Matter_Report
//
//  Created by Marshal on 2/28/25.
//



import SwiftUI
struct ReportMainLayout: View {
  var body: some View {
    NavigationView {
      VStack {
              Text("Reports") // Subheading
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top) // Add some top padding
              Spacer() // Push content down
        VStack(spacing: 20) {
          HStack(spacing: 20) {
            NavigationLink(destination: Reports_View()) {
              ReportButton(title: "NEW REPORT", icon: "plus")
            }
            NavigationLink(destination: Text("Saved Reports View")) {
              ReportButton(title: "SAVED", icon: "arrow.down.doc")
            }
          }
          HStack(spacing: 20) {
            NavigationLink(destination: Text("Deleted Reports View")) {
              ReportButton(title: "Deleted", icon: "doc.text")
            }
            NavigationLink(destination: Text("Archived Reports View")) {
              ReportButton(title: "ARCHIVED", icon: "archivebox")
            }
          }
          HStack(spacing: 20) {
            NavigationLink(destination: Text("Pinned Reports View")) {
              ReportButton(title: "PINNED", icon: "pin")
            }
            NavigationLink(destination: Text("All Reports View")) {
              ReportButton(title: "ALL REPORTS", icon: "doc.on.doc")
            }
          }
        }
        .padding()
        Spacer() // Push content up
      }
      .navigationBarHidden(true) // Keep the navigation bar hidden
    }
  }
}
struct ReportButton: View {
  let title: String
  let icon: String?
  var body: some View {
    VStack {
      if let iconName = icon {
        Image(systemName: iconName)
          .font(.title)
          .padding(.bottom, 8)
      }
      Text(title)
        .font(.subheadline)
        .fontWeight(.semibold)
    }
    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 80)
    .padding()
    .background(Color.blue)
    .foregroundColor(.white)
    .cornerRadius(10)
  }
}
#Preview {
  ReportMainLayout()
}


