//
//  GoalBreakdownView.swift
//  Matter_Report
//
//  Created by Tanaka Kufa on 28/2/2025.
//

import SwiftUI

struct CheckboxItem: Identifiable, Codable {
    let id: UUID
    let label: String
    var isChecked: Bool
    
    init(label: String, isChecked: Bool = false) {
        self.id = UUID()
        self.label = label
        self.isChecked = isChecked
    }
}

struct GoalBreakdown: View {
 
        
    @State private var checkboxItems: [CheckboxItem] = [
        CheckboxItem(label: "Task 1"),
        CheckboxItem(label: "Task 2"),
        CheckboxItem(label: "Task 3"),
        CheckboxItem(label: "Task 4")
    ]
    
    private var progress: Double {
        let total = Double(checkboxItems.count)
        let completed = Double(checkboxItems.filter { $0.isChecked }.count)
        return total > 0 ? completed / total : 0
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Elevator Goal breakdown")
                .font(.title2.bold())
            
            // Progress Circle
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 25)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(AngularGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), center: .center), lineWidth: 25)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: progress)
                Text("\(Int(progress * 100))%")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.primary)
            }
            .frame(width: 200, height: 200)
            .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
            
            // Task List
            VStack(spacing: 15) {
                Text("Tasks")
                    .font(.title2.bold())
                    .padding(.bottom, 10)
                
                ForEach($checkboxItems) { $item in
                    HStack {
                        Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(item.isChecked ? .blue : .gray)
                            .font(.title2)
                            .onTapGesture {
                                item.isChecked.toggle()
                            }
                        Text(item.label)
                            .font(.body)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal)
            
            // Save Button
            Button("Save") {
                saveCheckboxItems()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(15)
            .padding()
        }
        .padding()
        .onAppear(perform: loadCheckboxItems)
    }
    
    // Save to UserDefaults
    private func saveCheckboxItems() {
        if let encoded = try? JSONEncoder().encode(checkboxItems) {
            UserDefaults.standard.set(encoded, forKey: "CheckboxItems")
        }
    }
    
    // Load from UserDefaults
    private func loadCheckboxItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "CheckboxItems"),
           let decodedItems = try? JSONDecoder().decode([CheckboxItem].self, from: savedItems) {
            checkboxItems = decodedItems
        }
    }
}

#Preview {
    GoalBreakdown()
}


struct GoalBreakdown2: View {
    @State private var checkboxItems: [CheckboxItem] = [
        CheckboxItem(label: "Task 1"),
        CheckboxItem(label: "Task 2"),
        CheckboxItem(label: "Task 3"),
        CheckboxItem(label: "Task 4")
    ]
    
    private var progress: Double {
        let total = Double(checkboxItems.count)
        let completed = Double(checkboxItems.filter { $0.isChecked }.count)
        return total > 0 ? completed / total : 0
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Elevator Goal breakdown")
                .font(.title2.bold())
            
            // Progress Circle
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 25)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(AngularGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), center: .center), lineWidth: 25)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: progress)
                Text("\(Int(progress * 100))%")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.primary)
            }
            .frame(width: 200, height: 200)
            .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
            
            // Task List
            VStack(spacing: 15) {
                Text("Tasks")
                    .font(.title2.bold())
                    .padding(.bottom, 10)
                
                ForEach($checkboxItems) { $item in
                    HStack {
                        Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(item.isChecked ? .blue : .gray)
                            .font(.title2)
                            .onTapGesture {
                                item.isChecked.toggle()
                            }
                        Text(item.label)
                            .font(.body)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal)
            
            // Save Button
            Button("Save") {
                saveCheckboxItems()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(15)
            .padding()
        }
        .padding()
        .onAppear(perform: loadCheckboxItems)
    }
    
    // Save to UserDefaults
    private func saveCheckboxItems() {
        if let encoded = try? JSONEncoder().encode(checkboxItems) {
            UserDefaults.standard.set(encoded, forKey: "CheckboxItems")
        }
    }
    
    // Load from UserDefaults
    private func loadCheckboxItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "CheckboxItems"),
           let decodedItems = try? JSONDecoder().decode([CheckboxItem].self, from: savedItems) {
            checkboxItems = decodedItems
        }
    }
}

#Preview {
    GoalBreakdown2()
}

struct GoalBreakdown3: View {
    @State private var checkboxItems: [CheckboxItem] = [
        CheckboxItem(label: "Task 1"),
        CheckboxItem(label: "Task 2"),
        CheckboxItem(label: "Task 3"),
        CheckboxItem(label: "Task 4")
    ]
    
    private var progress: Double {
        let total = Double(checkboxItems.count)
        let completed = Double(checkboxItems.filter { $0.isChecked }.count)
        return total > 0 ? completed / total : 0
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Elevator Goal breakdown")
                .font(.title2.bold())
            
            // Progress Circle
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 25)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(AngularGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), center: .center), lineWidth: 25)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: progress)
                Text("\(Int(progress * 100))%")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.primary)
            }
            .frame(width: 200, height: 200)
            .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
            
            // Task List
            VStack(spacing: 15) {
                Text("Tasks")
                    .font(.title2.bold())
                    .padding(.bottom, 10)
                
                ForEach($checkboxItems) { $item in
                    HStack {
                        Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(item.isChecked ? .blue : .gray)
                            .font(.title2)
                            .onTapGesture {
                                item.isChecked.toggle()
                            }
                        Text(item.label)
                            .font(.body)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal)
            
            // Save Button
            Button("Save") {
                saveCheckboxItems()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(15)
            .padding()
        }
        .padding()
        .onAppear(perform: loadCheckboxItems)
    }
    
    // Save to UserDefaults
    private func saveCheckboxItems() {
        if let encoded = try? JSONEncoder().encode(checkboxItems) {
            UserDefaults.standard.set(encoded, forKey: "CheckboxItems")
        }
    }
    
    // Load from UserDefaults
    private func loadCheckboxItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "CheckboxItems"),
           let decodedItems = try? JSONDecoder().decode([CheckboxItem].self, from: savedItems) {
            checkboxItems = decodedItems
        }
    }
}

#Preview {
    GoalBreakdown3()
}


struct GoalBreakdown4: View {
    @State private var checkboxItems: [CheckboxItem] = [
        CheckboxItem(label: "Task 1"),
        CheckboxItem(label: "Task 2"),
        CheckboxItem(label: "Task 3"),
        CheckboxItem(label: "Task 4")
    ]
    
    private var progress: Double {
        let total = Double(checkboxItems.count)
        let completed = Double(checkboxItems.filter { $0.isChecked }.count)
        return total > 0 ? completed / total : 0
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Elevator Goal breakdown")
                .font(.title2.bold())
            
            // Progress Circle
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 25)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(AngularGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), center: .center), lineWidth: 25)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: progress)
                Text("\(Int(progress * 100))%")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.primary)
            }
            .frame(width: 200, height: 200)
            .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
            
            // Task List
            VStack(spacing: 15) {
                Text("Tasks")
                    .font(.title2.bold())
                    .padding(.bottom, 10)
                
                ForEach($checkboxItems) { $item in
                    HStack {
                        Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(item.isChecked ? .blue : .gray)
                            .font(.title2)
                            .onTapGesture {
                                item.isChecked.toggle()
                            }
                        Text(item.label)
                            .font(.body)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal)
            
            // Save Button
            Button("Save") {
                saveCheckboxItems()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(15)
            .padding()
        }
        .padding()
        .onAppear(perform: loadCheckboxItems)
    }
    
    // Save to UserDefaults
    private func saveCheckboxItems() {
        if let encoded = try? JSONEncoder().encode(checkboxItems) {
            UserDefaults.standard.set(encoded, forKey: "CheckboxItems")
        }
    }
    
    // Load from UserDefaults
    private func loadCheckboxItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "CheckboxItems"),
           let decodedItems = try? JSONDecoder().decode([CheckboxItem].self, from: savedItems) {
            checkboxItems = decodedItems
        }
    }
}

#Preview {
    GoalBreakdown4()
}
