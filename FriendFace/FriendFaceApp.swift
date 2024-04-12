//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Vinicius Ledis on 12/04/2024.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    let modelContainer: ModelContainer
        
    init() {
        do {
            modelContainer = try ModelContainer(for: User.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(modelContainer)
    }
}
