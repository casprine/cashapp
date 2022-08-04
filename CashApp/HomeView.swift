//
//  HomeView.swift
//  CashApp
//
//  Created by Cas on 17/06/2021.
//

import SwiftUI
import FontAwesomeSwiftUI

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
            
            CardView().tabItem{
                Image(systemName: "creditcard")
            }
            .edgesIgnoringSafeArea(.vertical)
            
            SendMoneyView().tabItem{
                Image(systemName: "bitcoinsign.circle")
            }
            .edgesIgnoringSafeArea(.vertical)
            
            InvestingView().tabItem{
                Image(systemName: "cloud")
            }
            .edgesIgnoringSafeArea(.vertical)
            
            ActivityView().tabItem{
                Image(systemName: "clock")
            }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
}


struct ActivityView: View {
    var body: some View {
        Text("Activity View")
    }
}


struct InvestingView: View {
    var body: some View {
        Text("Investing View")
    }
}


struct SendMoneyView: View {
    var body: some View {
        Text("Send Money View")
    }
}


struct CardView: View{
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
