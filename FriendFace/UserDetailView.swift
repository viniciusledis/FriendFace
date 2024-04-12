//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Vinicius Ledis on 10/07/2024.
//

import SwiftData
import SwiftUI

struct UserDetailView: View {
    var user: User
    
    var body: some View {
        ZStack {
            LinearGradient(colors: 
                [user.isActive
                    ? Color(red: 0.0, green: 0.4, blue: 0.2).opacity(0.6)
                    : Color(red: 0.4, green: 0.0, blue: 0.2).opacity(0.6),
                    .gray.opacity(0.1)],
                    startPoint: .bottom,
                    endPoint: .top)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack {
                        Text("Info")
                            .font(.largeTitle)
                        
                        Spacer()
                        Text( user.isActive ? "Online" : "Offline")
                            .foregroundStyle(user.isActive ? .green : .red)
                    }
                    
                    
                    HStack {
                        VStack {
                            HStack{
                                Text("Name: ")
                                    .frame(width: 90,alignment: .leading)
                                    .foregroundStyle(.gray)
                                Text(user.name)
                                Spacer()
                                
                            }
                            HStack{
                                Text("Age: ")
                                    .frame(width: 90,alignment: .leading)
                                    .foregroundStyle(.gray)
                                Text(user.age.description)
                                Spacer()
                            }
                            HStack{
                                Text("email: ")
                                    .frame(width: 90,alignment: .leading)
                                    .foregroundStyle(.gray)
                                Text(user.email)
                                Spacer()
                            }
                            HStack{
                                Text("registred: ")
                                    .frame(width: 90,alignment: .leading)
                                    .foregroundStyle(.gray)
                                Text(user.timeConverter())
                                Spacer()
                            }
                        }
                        
                    }
                }
                
                VStack {
                    HStack {
                        Text("About:")
                            .font(.largeTitle)
                            .padding(.vertical, 10)
                        Spacer()
                    }
                    Text(user.about)
                }
                .padding(.vertical, 20)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Friend's list")
                            .font(.largeTitle)
                            .padding(.vertical, 10)
                        Spacer()
                    }
                    
                    ScrollView {
                        LazyVStack(alignment: .leading) {
                            ForEach(user.friends, id: \.id ) { friend in
                                Text(friend.name)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("\(user.name)")
    }
}


#Preview {
    UserDetailView(user: User.example)
        .modelContainer(for: User.self)
}
