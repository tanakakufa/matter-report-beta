//
//  RoleView.swift
//  MatterReport
//
//  Created by Albertina Bongani on 2/27/25.
//

import SwiftUI

struct RoleView: View {
    @State private var selectedSection: String? = nil
    
    var body: some View {
        NavigationStack{
            VStack {
                //                Text("Roles")
                //                    .font(.largeTitle)
                //                    .fontWeight(.bold)
                //                    .padding()
                //
                //                Spacer()
                Group {
                    VStack(alignment: .leading, spacing: 30) {
//                        Divider().frame(height: 1).background(Color.gray)
                        
                        roleNavigationLink(label: "Managers", destination: Sign_up(), section: "Managers")
                        Divider().frame(height: 1).background(Color.gray)
                        
                        roleNavigationLink(label: "Facilitators", destination: Sign_up(), section: "Facilitators")
                        Divider().frame(height: 1).background(Color.gray)
                        
                        roleNavigationLink(label: "Students", destination: Sign_up(), section: "Students")
                        Divider().frame(height: 1).background(Color.gray)
                        
                        roleNavigationLink(label: "Interns", destination: Sign_up(), section: "Interns")
                        Divider().frame(height: 1).background(Color.gray)
                        
                        roleNavigationLink(label: "Project Managers", destination: Sign_up(), section: "Project Managers")
                        Divider().frame(height: 1).background(Color.gray)
                        
                        roleNavigationLink(label: "Sponsors", destination: Sign_up(), section: "Sponsors")
                        Divider().frame(height: 1).background(Color.gray)
                        
                        
                        
                    }
                    
                    .font(.title3)
//                    .padding()
                    
                }
            }
            .navigationTitle("Roles")
        }  .navigationBarBackButtonHidden(false)
    }
        
        
        private func roleNavigationLink<Destination: View>(label: String, destination: Destination, section: String) -> some View {
            NavigationLink(destination: destination) {
                InfoSection(label: label, icon: "chevron.right", isSelected: selectedSection == section)
            }
            .simultaneousGesture(TapGesture().onEnded {
                selectedSection = section
            })
        }
    }


struct InfoSection: View {
    var label: String
    var icon: String
    var isSelected: Bool

    var body: some View {
        HStack {
            Label(label, systemImage: icon)
                .foregroundColor(isSelected ? .blue : .primary)
                .font(.title)
                .bold()
            
            
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
    }
}


#Preview {
    RoleView()
}
