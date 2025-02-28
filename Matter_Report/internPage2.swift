//
//  internPage2.swift
//  Matter_Report
//
//  Created by Albertina Bongani on 2/28/25.
//
import SwiftUI

struct InternshipReportForm: View {
    @State private var studentName = ""
    @State private var institution = ""
    @State private var internshipStart = Date()
    @State private var internshipEnd = Date()
    @State private var companyName = ""
    @State private var supervisorName = ""
    @State private var positionHeld = ""


    @State private var weeklyLogs: [WeeklyLog] = Array(repeating: WeeklyLog(), count: 8)

    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Educational Information")) {
                    TextField("Student Name", text: $studentName)
                    TextField("Institution", text: $institution)
                    DatePicker("Internship Start Date", selection: $internshipStart, displayedComponents: .date)
                    DatePicker("Internship End Date", selection: $internshipEnd, displayedComponents: .date)
                }
                
                
                Section(header: Text("Organisational Details")) {
                    TextField("Company Name", text: $companyName)
                    TextField("Supervisor", text: $supervisorName)
                    TextField("Position Held", text: $positionHeld)
                }
                
                ScrollView(.horizontal){
                    Section(header: Text("Weekly Activity Log")) {
                        WeeklyLogView(weeklyLogs: $weeklyLogs)
                            
                    }
                }
                .navigationTitle("Internship Report")
            }
        }
    }
}

// MARK: - Weekly Log Model
struct WeeklyLog: Identifiable {
    let id = UUID()
    var tasksPerformed: String = ""
    var skillsLearned: String = ""
    var supervisorsNotes: String = ""
}

// MARK: - Weekly Log View
struct WeeklyLogView: View {
    @Binding var weeklyLogs: [WeeklyLog]

    var body: some View {
        VStack(spacing: 0) {
       
            WeeklyLogHeader()

        
            ForEach(weeklyLogs.indices, id: \.self) { index in
                WeeklyLogRow(weekNumber: index + 1, weeklyLog: $weeklyLogs[index])
            }

           
        }
        .padding()
    }
}

// MARK: - Table Header
struct WeeklyLogHeader: View {
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
struct WeeklyLogRow: View {
    let weekNumber: Int
    @Binding var weeklyLog: WeeklyLog

    var body: some View {
        HStack(spacing: 0) {
           
            Text("Week \(weekNumber)")
                .frame(width: 80, alignment: .center)
                .padding()
                .background(Color.gray.opacity(0.2))
                .border(Color.black, width: 1)

    
            WeeklyLogTextField(text: $weeklyLog.tasksPerformed, width: 90)
            WeeklyLogTextField(text: $weeklyLog.skillsLearned, width: 90)
            WeeklyLogTextField(text: $weeklyLog.supervisorsNotes, width: 100, isEditable: false)
        }
    }
}

// MARK: - Reusable TextField Component
struct WeeklyLogTextField: View {
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InternshipReportForm()
    }
}
