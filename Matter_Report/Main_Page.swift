
//
//  MainPage.swift
//  Matter_Report
//
//  Created by Marshal on 2/27/25.
//



import SwiftUI

struct MainPage: View {
  var body: some View {
    NavigationView { // Wrap everything in NavigationView
      HStack(spacing: 0) { // HStack with no spacing between the navigation and content
        // Left Navigation Panel
          
        VStack(alignment: .leading, spacing: 10) {
            // Increased spacing between links
            HStack{
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
                Spacer()
                
            }
          
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .center) // Center the logo text
            .padding()
            .background(Color(.systemGray5)) // Light gray background for the logo area
            .cornerRadius(10)
          // Navigation Links with Icons
            NavigationLink(destination: Matter_page()) {
            Label("MATTER", systemImage: "app.fill")

              .frame(maxWidth: .infinity, alignment: .leading)
              .padding()
              .background(Color.white)
              
              .cornerRadius(8) // Rounded corners for buttons
              .foregroundColor(.primary)
              .shadow(radius: 3)
          }
          NavigationLink(destination: Text("Matter View")) { // Link to the Reports_View
            Label("Reports", systemImage: "doc.text.fill")
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding()
              .background(Color.white)
              .cornerRadius(8)
              .foregroundColor(.primary)
              .shadow(radius: 3)
          }
          NavigationLink(destination: Text("Goals View")) {
            Label("Goals", systemImage: "star.fill")
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding()
              .background(Color.white)
              .cornerRadius(8)
              .foregroundColor(.primary)
              .shadow(radius: 3)
          }
            NavigationLink(destination: SponserPage()) {
            Label("Sponsors", systemImage: "person.fill")
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding()
              .background(Color.white)
              .cornerRadius(8)
              .foregroundColor(.primary)
              .shadow(radius: 3)
          }
          NavigationLink(destination: Text("Interns View")) {
            Label("Interns Enrolled", systemImage: "person.crop.circle.fill")
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding()
              .background(Color.white)
              .cornerRadius(8)
              .foregroundColor(.primary)
              .shadow(radius: 3)
          }
          NavigationLink(destination: Text("Students View")) {
            Label("Students Enrolled", systemImage: "person.2.fill")
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding()
              .background(Color.white)
              .cornerRadius(8)
              .foregroundColor(.primary)
              .shadow(radius: 3)
          }
          NavigationLink(destination: Text("More View")) {
            Label("More", systemImage: "ellipsis.circle.fill")
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding()
              .background(Color.white)
              .cornerRadius(8)
              .foregroundColor(.primary)
              .shadow(radius: 3)
          }
        }
        .frame(maxHeight: .infinity) // Make the left panel fill the available height
        .background(Color(.systemGray6)) // Light gray background for the navigation panel
        .cornerRadius(10)
        .padding([.top, .bottom], 10) // Add top and bottom padding to the navigation panel
        // Main Content Area
//        VStack {
//          Text("MCRI info")
//            .padding()
//          Spacer() // Push content to the top
//        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white) // White background for the main content
      }
    }
    .edgesIgnoringSafeArea(.all) // Extend the content to the edges of the screen
  }
}
#Preview {
  MainPage()
}



