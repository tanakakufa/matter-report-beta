//
//  Matter_ReportApp.swift
//  Matter_Report
//
//  Created by Victo-Jorge on 27/02/2025.
//
import SwiftUI
import UserNotifications

// 🔹 Notification Manager (Handles Permissions & Scheduling)
class NotificationManager: ObservableObject {
    static let shared = NotificationManager()
    
    @Published var lastNotification: String?  // 👈 Stores last notification for preview

    private init() {
        requestNotificationPermission()
    }
    
    // 1️⃣ Request Notification Permission
    func requestNotificationPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Permission Error: \(error.localizedDescription)")
                } else {
                    print("Permission granted: \(granted)")
                }
            }
        }
    }

    // 2️⃣ Schedule a Notification (Real + Simulated)
    func dispatchNotification() {
        let title = "New Report has been sent"
        let body = "Facilitator Weekly Report."
        
        DispatchQueue.main.async {
            self.lastNotification = "\(title)\n\(body)"  // 👈 Update preview in UI
        }

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        // 🔹 Trigger after 5 seconds (for real devices)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let request = UNNotificationRequest(identifier: "facilitatorReport", content: content, trigger: trigger)

        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("✅ Notification scheduled successfully!")
            }
        }
    }
}

// 🔹 First View (Navigates to SecondView)


// 🔹 Second View (Button to Trigger Notification + Simulated Preview)

// 🔹 App Entry Point
@main
struct MyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {

//            Reports_View()

//            Login(viewModel: SignUpViewModel())

            Matter_page()

        }
    }
}

// 🔹 Handle Foreground Notifications (AppDelegate)
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.delegate = self  // 👈 Needed for foreground notifications
        return true
    }

    // Show notifications while app is open
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])  // 👈 Show banner & sound while app is open
    }
}
