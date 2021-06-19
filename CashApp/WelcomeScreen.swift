//
//  WelcomeScreen.swift
//  CashApp
//
//  Created by Cas on 17/06/2021.
//

import SwiftUI

struct WelcomeScreen: View {
    @State var showTabView: Bool = false
    
    var body: some View {
        VStack {
            if self.showTabView {
                HomeView()
            } else {
                NavigationView{
                    VStack(spacing: 20){
                        Image(systemName: "checkmark.circle").foregroundColor(Color.accentColor).font(.system(size:50))
                        Text("Welcome to Cash App!").book(size: 30)
                    }
              
                    .navigationBarHidden(true)
                }
                .navigationBarHidden(true)
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.showTabView = true
                }
            }
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
