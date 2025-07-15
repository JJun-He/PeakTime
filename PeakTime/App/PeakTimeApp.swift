//
//  PeakTimeApp.swift
//  PeakTime
//
//  Created by 임뚱보 on 7/11/25.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

@main
struct PeakTimeApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView();
        }
    }
}

