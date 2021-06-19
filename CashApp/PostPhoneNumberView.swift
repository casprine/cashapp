//
//  PostPhoneNumberView.swift
//  CashApp
//
//  Created by Cas on 17/06/2021.
//

import SwiftUI


enum ActiveScreenState  {
    case confirmation
    case fullName
    case cashtag
}

import SwiftUI

struct PostPhoneNumberView: View {
    @State var phoneNumber: String = ""
    @State private var secretCode : String = ""
    @State private var fullName: String = ""
    @State private var cashTag: String = ""
    let activeScreen: ActiveScreenState = ActiveScreenState.cashtag
    
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
                
                             
                Group {
                    switch activeScreen {
                    case .confirmation :
                        ConfirmationCodeView(phoneNumber: self.$phoneNumber, secretCode: self.$secretCode)

                    case .fullName:
                        FullNameFormView(fullName: self.$fullName)


                    case .cashtag:
                        CashTagView(cashTag: self.$cashTag)

                    }
                    
                }
                Spacer()
                
                
                if activeScreen == .cashtag {
                    NavigationLink(
                        destination: InviteContactsView(),
                        label: {
                            HStack {
                                Text("Continue")
                                    .medium(size: 20)
                                    .padding(15)
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
//                                self.$activeScreen = ActiveScreenState.cashtag
//                                self.$activeScreen =  ActiveScreenState.cashtag
//                                self.$activeScreen = activeScreenType.fullName
//                                self.$activeScreen = .fullName
//                                self.$activeScreen =  activeScreen == .confirmation ?  .confirmation : .fullName
                            }
                        }){
                            Text("Next")
                                .medium(size: 20)
                                .padding(15)
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





struct CashTagView: View {
    @Binding var cashTag : String
    var body: some View {
        VStack(alignment:.leading){
            Text("Choose a $Cashtag")
                .medium(size: 25)
                .padding(.top, 50)

            Text("Your unique name for\ngetting page by anyone")
                .book(size: 20)
                .padding(.vertical, 15)
                .foregroundColor(.gray)


            TextField("Add tag",text: $cashTag)
                .font(.custom("CashMarket-RegularRounded", size:20))
                .ignoresSafeArea(.keyboard, edges: .bottom)


            Text("cash.app/$\(cashTag)")
                .book(size: 18)
                .padding(.vertical, 20)
                .foregroundColor(Color.gray)
        }
    }
}




struct FullNameFormView : View {
    @Binding var fullName : String
    var body: some View {
        VStack(alignment:.leading) {
            Text("Please enter your\nfirst and last name")
                .medium(size: 25)
                .lineLimit(2)
                .padding(.top, 50)

            TextField("Full Name",text: $fullName)
                .font(.custom("CashMarket-RegularRounded", size:20))
                .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}



struct ConfirmationCodeView: View  {
    @Binding var phoneNumber: String
    @Binding var secretCode: String
    var body: some View {
        VStack(alignment:.leading){
            Text("Please enter the code sent to \(phoneNumber)")
                .medium(size: 25)

            TextField("Confirmation Code",text: $secretCode)
                .font(.custom("CashMarket-RegularRounded", size:20))
                .ignoresSafeArea(.keyboard, edges: .bottom)

        }
    }
}


struct PostPhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PostPhoneNumberView()
                .navigationBarHidden(true)
        }
    }
}



