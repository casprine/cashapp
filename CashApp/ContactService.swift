//
//  ContactService.swift
//  CashApp
//
//  Created by Cas on 17/06/2021.
//

import Foundation
import Contacts


struct Contact {
    var id = UUID()
    var givenName: String
    var lastName: String

    var numbers: [PhoneNumber]

    var systemContact: CNContact? // --> This one is important! We keep a reference to later make it easier for editing the same contact.
    struct PhoneNumber { // --> We also have a PhoneNumber struct as they can have labels and we want to display them
        var label: String
        var number: String
    }

    init(givenName: String, lastName: String, numbers: [PhoneNumber], systemContact: CNContact) {
        self.givenName = givenName
        self.lastName = lastName
        self.numbers = numbers
        self.systemContact = systemContact
    }

    init(givenName: String, lastName: String, numbers: [PhoneNumber]) {
        self.givenName = givenName
        self.lastName = lastName
        self.numbers = numbers
    }

    static func fromCNContact(contact: CNContact) -> Contact {
        let numbers = contact.phoneNumbers.map({
            (value: CNLabeledValue<CNPhoneNumber>) -> Contact.PhoneNumber in

            let localized = CNLabeledValue<NSString>.localizedString(forLabel: value.label ?? "")

            return Contact.PhoneNumber.init(label: localized, number: value.value.stringValue)

        })

        return self.init(givenName: contact.givenName, lastName: contact.familyName, numbers: numbers, systemContact: contact)
    }

    func fullName() -> String {
        return "\(self.givenName) \(self.lastName)"
    }
}


class ContactService {
    
    var contactStore: CNContactStore?

    func fetchOrRequestPermission(completionHandler: @escaping (Bool) -> Void) {
        self.contactStore = CNContactStore.init()
        self.contactStore!.requestAccess(for: .contacts) { success, error in
            if (success) {
                completionHandler(true)
                print("Got Access")
            } else {
                completionHandler(false)
            }
        }
    }
    
    
    func getSystemContacts(completionHandler: @escaping ([Contact], Error?) -> Void) {
        self.fetchOrRequestPermission() { success in    // --> First, we need to make sure we have permission to fetch the contacts
            if (success) {
                do {
                    let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
                    // --> The keysToFetch describe which content we actually want to access. It is good practice to keep this as limited as your app allows.
                    var contacts = [CNContact]()

                    let request = CNContactFetchRequest(keysToFetch: keysToFetch)

                    try self.contactStore!.enumerateContacts(with: request) {
                        (contact, stop) in
                        contacts.append(contact)
                    }

                    func getName(_ contact: Contact) -> String { // --> see below for the Contact model and why we implement one
                        return contact.lastName.count > 0 ? contact.lastName : contact.givenName    // --> essentially, this is some sugar to order the contacts, as we often want to have them already ordered and not do it inside the model
                    }

                    let formatted = contacts.compactMap({
                        // filter out all "empty" contacts
                        if ($0.phoneNumbers.count > 0 && ($0.givenName.count > 0 || $0.familyName.count > 0)) { // --> This is a fun one. On multiple different devices I have encountered those "empty contacts" where no information is stored for some reason. We don't need them so they're filtered out as well.
                            return Contact.fromCNContact(contact: $0)
                        }

                        return nil
                    })
                            .sorted(by: { getName($0) < getName($1) }) // --> order by lastname/firstname
                        completionHandler(formatted, nil)
                } catch {
                    print("Failed to fetch contact, error: \(error)")
                    completionHandler([], NSError()) // --> as a fallback, we return an empty array but we should capture the error elsewhere
                }
            } else {
                completionHandler([], NSError()) // --> also, please don't just return empty errors, I was lazy because I know where the error is coming from, but you maybe will not or can't remember why
            }
        }
    }
}
