//
//  Supabase.swift
//  Matter_Report
//
//  Created by Victo-Jorge on 27/02/2025.
//

//Initializing supabase
import Foundation
import Supabase

final class SupabaseManager {
    
    static let shared = SupabaseManager()

    let supabase: SupabaseClient
   
    private init() {
        // Correct Supabase URL and API Key from your provided code
        let supabaseUrl = URL(string: "https://barxmergwzuvvmndntfg.supabase.co")! // (keep your Supabase URL)
        let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJhcnhtZXJnd3p1dnZtbmRudGZnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA2NTY3OTMsImV4cCI6MjA1NjIzMjc5M30.Ufm1RHx4ekiebLwHwi1DmTPxQYLX3EouL7b4SPg0Y1s" // (keep your Supabase API Key)

        self.supabase = SupabaseClient(supabaseURL: supabaseUrl, supabaseKey: supabaseKey)
    }

}

import Supabase

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://barxmergwzuvvmndntfg.supabase.co")!,
  supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJhcnhtZXJnd3p1dnZtbmRudGZnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA2NTY3OTMsImV4cCI6MjA1NjIzMjc5M30.Ufm1RHx4ekiebLwHwi1DmTPxQYLX3EouL7b4SPg0Y1s"
)
