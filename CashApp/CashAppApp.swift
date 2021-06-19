//
//  CashAppApp.swift
//  CashApp
//
//  Created by Cas on 17/06/2021.
//

import SwiftUI

@main
struct CashAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContactStore())
        }
    }
}
