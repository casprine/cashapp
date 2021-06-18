//
//  BankingView.swift
//  CashApp
//
//  Created by Cas on 17/06/2021.
//

import SwiftUI
import FontAwesomeSwiftUI

struct BankingView: View {
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                HeaderView()
                CashBalanceView()
                CTAButtons()
                AccountDetailsView()
                    .padding(.bottom, 10)
                ActionItem(title: "Deposits & Transfers", icon:"arrow.up.arrow.down", iconBgColor: Color.accentColor)
                if #available(iOS 15.0, *) {
                    ActionItem(title: "Bitcoin", icon: "bitcoinsign.circle", iconBgColor:Color.teal)
                } else {
                    ActionItem(title: "Bitcoin", icon: "bitcoinsign.circle", iconBgColor:Color.blue)
                }
                ActionItem(title: "Limits", icon:"arrowtriangle.up.fill", iconBgColor: Color("gray.200"), iconColor: Color("gray.400"))
                
            }.padding(.top, 50)
            
        }
        .background(Color("gray.50"))
    }
}



struct HeaderView: View {
    var body: some View {
        HStack{
            Text("Banking").medium(size: 28)
            Spacer()
            Image(systemName: "person.crop.circle")
                .foregroundColor(Color("gray.800"))
                .font(.system(size: 30))
            
        }.padding()
    }
}


struct CashBalanceView: View {
    var body: some View {
        VStack(spacing:0){
            Text("$0.00")
                .medium(size: 55)
                .foregroundColor(Color("gray.800"))
            Text("Cash Balance")
                .book(size: 18)
                .foregroundColor(Color("gray.700"))
                .padding(.top, 5)
        }.padding(.top, 30)
    }
}


struct CTAButtons: View {
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                withAnimation{
                    
                }
            }) {
                Text("Add Cash")
                    .medium(size: 20)
                    .foregroundColor(Color("gray.800"))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 12)
            }
            .background(Color("gray.100"))
            .cornerRadius(30)
            
            Spacer()
            
            Button (action:{
                withAnimation{
                    
                }
            }) {
                Text("Cash Out")
                    .medium(size: 20)
                    .foregroundColor(Color("gray.800"))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 12)
            }
            .background(Color("gray.100"))
            .cornerRadius(30)
            Spacer()
        }
        .padding(.top, 65)
    }
}

struct AccountDetailsView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing:0){
                Text("041 215 663")
                    .medium(size: 17)
                    .foregroundColor(Color("gray.800"))
                Text("Routing")
                    .book(size: 18)
                    .foregroundColor(Color("gray.700"))
                    .padding(.top, 4)
                    
            }
            .padding(.horizontal, 30)
            
            Spacer()
            VStack(spacing:0){
                Text("893 **** ****")
                    .medium(size: 17)
                    .foregroundColor(Color("gray.800"))
                Text("Account")
                    .book(size: 18)
                    .foregroundColor(Color("gray.700"))
                    .padding(.top, 4)
            }
            .padding(.horizontal, 30)
            Spacer()
        }.padding(.top, 40)
        
    }
}



struct ActionItem :View {
    var title: String
    var icon : String
    var iconBgColor : Color
    var iconColor: Color? = Color.white
    
    var body: some View {
        Button(action: {
        }){
            HStack {
                HStack {
                    Image(systemName: icon)
                        .font(.system(size: 17, weight:.bold))
                        .foregroundColor(iconColor)
                }
                .frame(width: 40, height:40)
                .background(iconBgColor)
                .cornerRadius(12)
                
                
                Text(title)
                    .medium(size:20)
                    .padding(.leading, 10)
                    .foregroundColor(Color("gray.800"))
                
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color("gray.300"))
                    .font(.system(size: 17, weight:.bold))
                
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
        }
    }
}



struct BankingView_Previews: PreviewProvider {
    static var previews: some View {
        BankingView()
    }
}
