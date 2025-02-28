//
//  GoalsView.swift
//  Matter_Report
//
//  Created by Tanaka Kufa on 27/2/2025.
//

import SwiftUI

struct GoalsView: View {
    
    @State var progress: CGFloat = 0.65
    @State private var isEditing = false
    @State var editedText: String = ""
    @State var navigateToGoalBreakDown = false
    @State var navigateToGoalBreakDown2 = false
    @State var navigateToGoalBreakDown3 = false
    @State var navigateToGoalBreakDown4 = false
    var width: CGFloat = 300
    var height: CGFloat = 12
    var CRadius: CGFloat = 10
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Header
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        
                        Text("Goals")
                            .font(.largeTitle.bold())
                            .padding(.horizontal)
                        Spacer()
                    }
                    
                    
                    // Goal Progress Buttons
                    ForEach(0..<4) { index in
                        GoalProgressView(progress: progress, width: 350, height: height, CRadius: CRadius)
                            .onTapGesture {
                                navigateToGoalBreakDown = true
                            }
                    }
                    
                    // Navigation Link
                    NavigationLink(destination: GoalBreakdown(), isActive: $navigateToGoalBreakDown) {
                        EmptyView()
                    }
                }
                
                
                // Add Goal Button
                HStack {
                    Spacer()
                    Button("Add Goal") {
                        isEditing = true
                    }
                    .frame(width: 70)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .sheet(isPresented: $isEditing) {
                        AddGoalSheet(editedText: $editedText)
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct GoalProgressView: View {
    var progress: CGFloat
    var width: CGFloat
    var height: CGFloat
    var CRadius: CGFloat
    
    var body: some View {
     
        VStack(alignment: .leading, spacing: 10) {
            
            Text("\(Int(progress * 100))% To Complete")
                .bold()
                .font(.callout)
            
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerRadius: CRadius)
                    .frame(width: 300, height: height)
                    .foregroundStyle(.black.opacity(0.2))
                RoundedRectangle(cornerRadius: CRadius)
                    .frame(width: progress * width, height: height)
                    .foregroundStyle(.blue)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .stroke(.black, lineWidth: 2)
                .frame(width: 350, height: 70)
        )
    }
}

struct AddGoalSheet: View {
    @Binding var editedText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Enter details on the goal you would like to add")
                .font(.headline)
                .padding(.bottom, 10)
            
            TextEditor(text: $editedText)
                .frame(minHeight: 200)
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}


