//
//  EmailConfirmationView.swift
//  Cash App
//
//  Created by Cas on 16/06/2021.
//

enum activeScreenType  {
    case confirmation
    case fullName
    case cashtag
}

import SwiftUI

struct EmailConfirmationView: View {
    
    @State var phoneNumber: String = ""
    @State private var secretCode : String = ""
    @State private var fullName: String = ""
    @State private var cashTag: String = ""
    @State private var activeScreen : activeScreenType = .confirmation
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading) {
                
                if activeScreen == .confirmation {
                    HStack (alignment: .center, spacing: nil, content: {
                        Spacer()
                        Text("?")
                            .bold(size:20)
                    })
                }
                
                switch activeScreen {
                case .confirmation :
                    Text("Please enter the code sent to \(phoneNumber)")
                        .medium(size: 20)
                    
                    TextField("Confirmation Code",text: $secretCode)
                        .font(.custom("CashMarket-RegularRounded", size:17))
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                    
                    
                case .fullName:
                    Text("Please enter your\nfirst and last name")
                        .medium(size: 20)
                        .lineLimit(2)
                    
                    TextField("Full Name",text: $secretCode)
                        .font(.custom("CashMarket-RegularRounded", size:17))
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                    
                    
                case .cashtag:
                    Text("Choose a $Cashtag")
                        .medium(size: 20)
                    
                    Text("Your unique name for\ngetting page by anyone")
                        .book(size: 18)
                        .padding(.vertical, 15)
                        .foregroundColor(.gray)
                    
                    
                    TextField("Add tag",text: $cashTag)
                        .font(.custom("CashMarket-RegularRounded", size:17))
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                    
                    
                    Text("cash.app/$\(cashTag)")
                        .book(size: 16)
                        .padding(.vertical, 20)
                        .foregroundColor(Color.gray)
                    
                }
                
                Spacer()
                
                
                if activeScreen == .cashtag {
                    NavigationLink(
                        destination: Text("Hello"),
                        label: {
                            HStack {
                                Text("Continue")
                                    .medium(size: 16)
                                    .padding(12)
                                    .foregroundColor(.white)
                                    .frame(maxWidth:.infinity)
                            }
                            .background(Color.green)
                            .cornerRadius(30)
                        })
                }
                
                
                if activeScreen != .cashtag {
                    HStack {
                        Button(action:{
                            withAnimation{
                                self.$activeScreen =  activeScreen == .confirmation ?  .confirmation : .fullName
                            }
                        }){
                            Text("Next")
                                .medium(size: 16)
                                .padding(12)
                                .foregroundColor(.white)
                                .frame(maxWidth:.infinity)
                        }
                    }
                    .background(Color.green)
                    .cornerRadius(30)
                }
                
            }.padding()
        }
        .navigationBarHidden(true)
    }
}

struct EmailConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        EmailConfirmationView()
    }
}
