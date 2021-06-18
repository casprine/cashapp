//
//  HomeView.swift
//  CashApp
//
//  Created by Cas on 17/06/2021.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("gray.50"))
       }

    var body: some View {
        TabView{
            BankingView().tabItem{
                Image(systemName: "house")
            }
            .edgesIgnoringSafeArea(.vertical)
            
            
            SecondView().tabItem{
                Image(systemName: "checkmark")
            }
        }
    }
}


struct SecondView: View{
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("gray.50"))
       }

    var body: some View {
            Text("Something here")
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
