//
//  StudentPage.swift
//  MatterReport
//
//  Created by Albertina Bongani on 2/27/25.
//

import SwiftUI

struct StudentPage: View {
    @State private var studentName = ""
    @State private var institution = ""
    @State private var studentStart = Date()
    @State private var studentEnd = Date()
    


    @State private var weeklyLogs1: [WeeklyLog1] = Array(repeating: WeeklyLog1(), count: 8)

    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Educational Information")) {
                    TextField("Student Name", text: $studentName)
                    TextField("Institution", text: $institution)
                    DatePicker("Student Start Date", selection: $studentStart, displayedComponents: .date)
                    DatePicker("Student End Date", selection: $studentEnd, displayedComponents: .date)
                }
                
                
                ScrollView(.horizontal){
                    Section(header: Text("Weekly Activity Log")) {
                        WeeklyLogView1(weeklyLogs1: $weeklyLogs1)
                            
                    }
                }
                .navigationTitle("Internship Report")
            }
        }
    }
}

// MARK: - Weekly Log Model
struct WeeklyLog1: Identifiable {
    let id = UUID()
    var tasksPerformed: String = ""
    var skillsLearned: String = ""
    var supervisorsNotes: String = ""
}

// MARK: - Weekly Log View
struct WeeklyLogView1: View {
    @Binding var weeklyLogs1: [WeeklyLog1]

    var body: some View {
        VStack(spacing: 0) {
       
            WeeklyLogHeader()

        
            ForEach(weeklyLogs1.indices, id: \.self) { index in
                WeeklyLogRow1(weekNumber1: index + 1, weeklyLog1: $weeklyLogs1[index])
            }

           
        }
        .padding()
    }
}

// MARK: - Table Header
struct WeeklyLogHeader1: View {
    let headers = ["Week", "Tasks Performed", "Skills Learned", "Supervisor's Notes"]
    let columnWidths: [CGFloat] = [80, 90, 90, 100]
  
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(zip(headers, columnWidths)), id: \.0) { (title, width) in
                Text(title)
                    .frame(width: width)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.blue.opacity(0.3))
                    .border(Color.black, width: 1)
                
            }
        } .frame(height: 50)
    }
}

// MARK: - Weekly Log Row
struct WeeklyLogRow1: View {
    let weekNumber1: Int
    @Binding var weeklyLog1: WeeklyLog1

    var body: some View {
        HStack(spacing: 0) {
           
            Text("Week \(weekNumber1)")
                .frame(width: 80, alignment: .center)
                .padding()
                .background(Color.gray.opacity(0.2))
                .border(Color.black, width: 1)

    
            WeeklyLogTextField(text: $weeklyLog1.tasksPerformed, width: 90)
            WeeklyLogTextField(text: $weeklyLog1.skillsLearned, width: 90)
            WeeklyLogTextField(text: $weeklyLog1.supervisorsNotes, width: 100, isEditable: false)
        }
    }
}

// MARK: - Reusable TextField Component
struct WeeklyLogTextField1: View {
    @Binding var text: String
    let width: CGFloat
    var isEditable: Bool = true

    var body: some View {
        TextField("", text: $text)
            .frame(width: width)
            .padding()
            .border(Color.black, width: 1)
            .disabled(!isEditable)
    }
}

// MARK: - Preview
struct ContentView_Previews1: PreviewProvider {
    static var previews: some View {
        StudentPage()
    }
}

