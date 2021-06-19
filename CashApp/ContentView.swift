//
//  ContentView.swift
//  CashApp
//
//  Created by Cas on 17/06/2021.
//

import SwiftUI
import FontAwesomeSwiftUI

struct ContentView: View {
    init(){
        FontAwesome.register()
    }
    
    var body: some View {
        NavigationView{
            PhoneNumberOnboardingView()
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
