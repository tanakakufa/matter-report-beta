//
//  Saved_Notes.swift
//  Matter_Report
//
//  Created by Mildred Ngoma  on 2/28/25.
//

import SwiftUI

struct Saved_Notes: View {
    @State var savedNotes: [String] = ["Cohorth 4", "Cohorth 3", "Cohorth 10", "Cohorth 12", "Cohorth 12", "Cohorth 0", "Cohorth 3", "Cohorth 3", "Cohorth 3", "Cohorth 8", "Cohorth 3", "Cohorth 5", "Cohorth 2", "Cohorth 1"]
    @State private var pinnedNotes: Set<Int> = [] // Track pinned notes by index

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Saved Reports:")
                        .padding()
                        .font(.custom("", size: 34))
                        .padding(.top, 50)
                    Spacer()
                }

                List {
                    // Pinned Notes Section
                    if !pinnedNotes.isEmpty {
                        Section(header: Text("Pinned Reports").font(.headline)) {
                            ForEach(savedNotes.indices, id: \.self) { index in
                                if pinnedNotes.contains(index) {
                                    NoteRow(note: savedNotes[index], index: index)
                                        .swipeActions {
                                            // Pin action, which toggles pin/unpin
                                            Button {
                                                togglePin(for: index)
                                            } label: {
                                                Image(systemName: "pin")
                                            }
                                            .tint(.yellow)
                                            
                                            // Delete action
                                            Button(role: .destructive) {
                                                delete(at: IndexSet([index]))
                                            } label: {
                                                Image(systemName: "trash")
                                            }
                                        }
                                }
                            }
                        }
                    }

                    // Regular Notes Section
                    Section(header: Text("All Reports").font(.headline)) {
                        ForEach(savedNotes.indices, id: \.self) { index in
                            if !pinnedNotes.contains(index) {
                                NoteRow(note: savedNotes[index], index: index)
                                    .swipeActions {
                                        // Pin action, which toggles pin/unpin
                                        Button {
                                            togglePin(for: index)
                                        } label: {
                                            Image(systemName: "pin")
                                        }
                                        .tint(.yellow)
                                        
                                        // Delete action
                                        Button(role: .destructive) {
                                            delete(at: IndexSet([index]))
                                        } label: {
                                            Image(systemName: "trash")
                                        }
                                    }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                }
            }
        }
    }

    func delete(at offsets: IndexSet) {
        savedNotes.remove(atOffsets: offsets)
        pinnedNotes.subtract(offsets) // Remove any pinned status from deleted notes
    }

    // Toggle pin/unpin a note
    func togglePin(for index: Int) {
        if pinnedNotes.contains(index) {
            pinnedNotes.remove(index)
        } else {
            pinnedNotes.insert(index)
        }
    }
}

struct NoteRow: View {
    var note: String
    var index: Int
    
    var body: some View {
        HStack {
            Text(note)
                .font(.title)
                .padding(.all, 6)
                .background(Color.blue.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
            
            Spacer()
        }
    }
}

#Preview {
    Saved_Notes()
}
