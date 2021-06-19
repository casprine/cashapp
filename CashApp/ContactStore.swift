//
//  ContactStore.swift
//  CashApp
//
//  Created by Cas on 18/06/2021.
//

import Combine
import SwiftUI



class ContactStore : ObservableObject {
    var contactServce = ContactService()
    
    @Published var contacts: [Contact] = []
    @Published var noPermission = true
    
    
//    init(){
//        self.fetch()
//    }
    
    func fetch() {
        DispatchQueue.main.async {
            self.contactServce.getSystemContacts{ (contacts, error) in
                guard error == nil else {
                    self.contacts = []
                    self.noPermission = true
                    return
                }
                self.contacts = contacts
                self.noPermission = false
                
            }
        }
    }
}






