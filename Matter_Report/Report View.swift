import SwiftUI
import PhotosUI
import Supabase
import Foundation
struct Reports_View: View {
  @ObservedObject var notificationManager = NotificationManager.shared
  @State var isLoading = false
  @State private var name: String = ""
  @State private var sender: String = ""
  @State private var from: String = ""
  @State private var subject: String = ""
  @State private var date: Date = Date()
    @State private var selectedTime = Date()
  @State private var description: String = ""
  @State private var selectedPhoto: PhotosPickerItem? = nil
  @State private var image: Image? = nil
  @State private var goToSaved: Bool = false
  @State private var isSaved: Bool = false // Track if report is saved
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Report Details")) {
          HStack {
            Text("To:")
            TextField("Recipient", text: $name)
          }
          HStack {
            Text("From:")
            TextField("Sender", text: $from)
          }
          HStack {
            Text("Subject:")
            TextField("Enter Subject", text: $subject)
          }
        }
        Section(header: Text("Date and Time")) {
          DatePicker("Select Date", selection: $date, displayedComponents: .date)
            
            DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
        }
        Section(header: Text("Description")) {
          TextEditor(text: $description)
            .frame(height: 150)
            .border(Color.gray, width: 1)
            .padding(.vertical, 5)
        }
        Section(header: Text("Upload Photo")) {
          PhotosPicker("Select Photo", selection: $selectedPhoto, matching: .images)
            .onChange(of: selectedPhoto) { newItem in
              Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                  let uiImage = UIImage(data: data) {
                  image = Image(uiImage: uiImage)
                }
              }
            }
          if let image = image {
            image
              .resizable()
              .scaledToFit()
              .frame(height: 200)
          }
        }
        Section {
          if !isSaved { // Show "Save Report" button if not saved
              Button(action:{ updateSaveButtonTapped();notificationManager.dispatchNotification()}) {
              Text("Save Report")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green) // Use a different color to distinguish
                .foregroundColor(.white)
                .cornerRadius(8)
            }
          } else { // Show a message if saved
            
            Text("Report Saved")
              .foregroundColor(.gray)
              .frame(maxWidth: .infinity)
          }
          //     Button(action: sendReport) {
          //
          //       Text("Send Report")
          //       .frame(maxWidth: .infinity)
          //       .padding()
          //       .background(Color.blue)
          //       .foregroundColor(.white)
          //       .cornerRadius(8)
          //     }
          Button(action: {
            notificationManager.dispatchNotification()
            sendReport()
          }) {
            Text("Send Report")
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color.blue)
              .foregroundColor(.white)
              .cornerRadius(8)
          }
        }
      }
      .navigationTitle("Add New Report")
      .navigationBarTitleDisplayMode(.inline)
    }.task {
      await getInitialReport()
    }
  }
  private func saveReport() {
    // Implement saving logic (e.g., UserDefaults, Core Data, file system)
    let reportData: [String: Any] = [
      "name": name,
      "from": from,
      "subject": subject,
      "date": date,
      "description": description
      // Add image data if needed
    ]
    UserDefaults.standard.set(reportData, forKey: "savedReport") // Example using UserDefaults
    isSaved = true // Mark report as saved
    print("Report Saved: \(name), \(from), \(subject), \(description)")
  }
  private func sendReport() {
    // Handle sending the report
    print("Report Sent: \(name), \(from), \(subject), \(description)")
  }
  func getInitialReport() async {
    do {
      let currentUser = try await supabase.auth.session.user
      let profile: Reports =
      try await supabase
        .from("profiles")
        .select()
        .eq("id", value: currentUser.id)
        .single()
        .execute()
        .value
      self.sender = profile.sender ?? ""
      self.from = profile.from ?? ""
      self.description = profile.description ?? ""
    } catch {
      debugPrint(error)
    }
  }
  func updateSaveButtonTapped() {
    Task {
     isLoading = true
     defer { isLoading = false }
     do {
      let currentUser = try await supabase.auth.session.user
      try await supabase
       .from("profiles")
       .update(
        UpdateReportParams(
          sender: sender,
          from: from,
          description: description
        )
       )
       .eq("id", value: currentUser.id)
       .execute()
     } catch {
      debugPrint(error)
     }
    }
   }
  }

#Preview {
 Reports_View()
}
