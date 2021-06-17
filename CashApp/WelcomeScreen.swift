//
//  WelcomeScreen.swift
//  CashApp
//
//  Created by Cas on 17/06/2021.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
                
        VStack(spacing: 20){
            Image(systemName: "checkmark.circle").foregroundColor(Color.accentColor).font(.system(size:50))
            Text("Welcome to Cash App!").book(size: 30)
        }
        
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
