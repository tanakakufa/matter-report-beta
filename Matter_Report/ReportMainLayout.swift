//
//  ReportMainLayout.swift
//  Matter_Report
//
//  Created by Marshal on 2/28/25.
//



import SwiftUI
struct ReportMainLayout: View {
  var body: some View {
      NavigationStack {
      VStack {
          HStack{

              Text("Reports") // Subheading
                  .padding()
                  .font(.custom("Georgia", size: 50))
                  .fontWeight(.bold)
                  .foregroundColor(.black)
                  .padding(.top)
              Spacer()
          }
              // Add some top padding
              Spacer() // Push content down
        VStack(spacing: 50) {
          HStack(spacing: 30) {
            NavigationLink(destination: Reports_View()) {
              ReportButton(title: "NEW REPORT", icon: "plus")
            }
              NavigationLink(destination: Saved_Notes()) {
              ReportButton(title: "SAVED", icon: "arrow.down.doc")
            }
          }
          HStack(spacing: 30) {
            NavigationLink(destination: Text("Deleted Reports View")) {
              ReportButton(title: "Deleted", icon: "doc.text")
            }
            NavigationLink(destination: Text("Archived Reports View")) {
              ReportButton(title: "ARCHIVED", icon: "archivebox")
            }
          }
          HStack(spacing: 30) {
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
      
//      .navigationBarHidden(true) // Keep the navigation bar hidden
        
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
    .frame(minWidth: 90, maxWidth: .infinity, minHeight: 100)
    .padding()
    .background(Color.blue)
    .foregroundColor(.white)
    .cornerRadius(10)
  }
}
#Preview {
  ReportMainLayout()
}


