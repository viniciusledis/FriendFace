//
//  User.swift
//  FriendFace
//
//  Created by Vinicius Ledis on 10/07/2024.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class User: Codable {
    enum CodingKeys: CodingKey {
            case id, isActive, name, age, company, email, address, about, registered, tags, friends
        }
        
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
    
    static let example = User(id: "1", isActive: true, name: "Vinicius Ledis", age: 25, company: "Apple", email: "vinicius.ledis@apple.com", address: "Rua ABC, 15", about: "This is a test", registered: "2015-11-10T01:47:18-00:00", tags: ["Ledin", "Ledão"], friends: [Friend]())
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decode(String.self, forKey: .id)
            self.isActive = try container.decode(Bool.self, forKey: .isActive)
            self.name = try container.decode(String.self, forKey: .name)
            self.age = try container.decode(Int.self, forKey: .age)
            self.company = try container.decode(String.self, forKey: .company)
            self.email = try container.decode(String.self, forKey: .email)
            self.address = try container.decode(String.self, forKey: .address)
            self.about = try container.decode(String.self, forKey: .about)
            self.registered = try container.decode(String.self, forKey: .registered)
            self.tags = try container.decode([String].self, forKey: .tags)
            self.friends = try container.decode([Friend].self, forKey: .friends)
        }
        
        init(id: String, isActive: Bool, name: String, age: Int, company: String, email: String, address: String, about: String, registered: String, tags: [String], friends: [Friend]) {
            self.id = id
            self.isActive = isActive
            self.name = name
            self.age = age
            self.company = company
            self.email = email
            self.address = address
            self.about = about
            self.registered = registered
            self.tags = tags
            self.friends = friends
        }
        
        func timeConverter () -> String {
            let dateFormatter = ISO8601DateFormatter()
            guard let date = dateFormatter.date(from: registered) else {
                return ""
            }
            return date.formatted()
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(isActive, forKey: .isActive)
            try container.encode(name, forKey: .name)
            try container.encode(age, forKey: .age)
            try container.encode(company, forKey: .company)
            try container.encode(email, forKey: .email)
            try container.encode(address, forKey: .address)
            try container.encode(about, forKey: .about)
            try container.encode(registered, forKey: .registered)
            try container.encode(tags, forKey: .tags)
            try container.encode(friends, forKey: .friends)
        }
}

class Friend: Codable {
    var id: String
    var name: String
        
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
