//
//  NewContactViewController.swift
//  UserDefaultsExample
//
//  Created by Егоров Михаил on 05.03.2023.
//

import UIKit

class NewContactViewController: UIViewController {

    
    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    var delegate: NewContactViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameTextField.addTarget(
            self,
            action: #selector(firstNameTextFieldDidChanged),
            for: .editingChanged
        )
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        saveAndExit()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @objc func firstNameTextFieldDidChanged() {
        guard let firstName = firstNameTextField.text else { return }
        doneButton.isEnabled = !firstName.isEmpty
    }
    
    private func saveAndExit() {
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        
        let contact = Contact(name: firstName, surname: lastName)
        StorageManager.shared.save(contact: contact)
        
        delegate.saveContact(contact)
        dismiss(animated: true)
    }
}
