//
//  ContentView.swift
//  Matter_Report
//
//  Created by Victo-Jorge on 27/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    var body: some View {
        NavigationView{
            VStack {
                Form{
                    
                    TextField("Name ", text: $name)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 4))
                        .foregroundColor(.gray)
                        .padding()
                    TextField("Name ", text: $name)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 4))
                        .foregroundColor(.gray)
                        .padding()
                    
                    
                }
                
                .navigationTitle("Report")
            }
        }
    }
}
#Preview {
    ContentView()
}
