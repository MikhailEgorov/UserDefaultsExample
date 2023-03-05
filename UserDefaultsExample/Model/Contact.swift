//
//  Contact.swift
//  UserDefaultsExample
//
//  Created by Егоров Михаил on 05.03.2023.
//

struct Contact: Codable {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
