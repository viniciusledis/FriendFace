//
//  ContentView.swift
//  FriendFace
//
//  Created by Vinicius Ledis on 12/04/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    NavigationLink(value: user) {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.isActive ? "Active" : "Not Active")
                                .font(.subheadline)
                                .foregroundStyle(user.isActive ? .green : .red)
                        }
                    }
                }
            }            
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
            .task {
                if users.isEmpty {
                    await fetchData()
                }
            }
        }
    }
    
    func fetchData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()

            let decodedUsers = try decoder.decode([User].self, from: data)
              for user in decodedUsers {
                  modelContext.insert(user)
                  try modelContext.save()
            }
        } catch {
            print("Error fetching data")
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: User.self)
}
