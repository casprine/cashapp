//
//  ContactsViewModel.swift
//  CashApp
//
//  Created by Cas on 17/06/2021.
//

import Foundation


class ContactsViewModel: ObservableObject {
    var contactServce = ContactService()
    
    @Published var contacts: [Contact] = []
    @Published var noPermission = true
    
        
//    init() {
//        self.fetch()
//    }
//
    func fetch() {
        self.contactServce.getSystemContacts { (contacts, error) in
            guard error == nil else {
                self.contacts = []
                self.noPermission = true
                return
            }
            
            self.contacts = contacts
            
        }
    }    
}
