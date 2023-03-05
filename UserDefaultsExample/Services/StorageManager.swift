//
//  StorageManager.swift
//  UserDefaultsExample
//
//  Created by Егоров Михаил on 05.03.2023.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "contacts"
    
    private init() {}
    
    func save(contact: Contact) {
        var contacts = fetchContacts()
        contacts.append(contact)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func fetchContacts() -> [Contact] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        // try with ? becouse guard
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func deleteContact(at index: Int) {
        var contacts  = fetchContacts()
        contacts.remove(at: index)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: key)
    }
}
