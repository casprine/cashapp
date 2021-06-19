//
//  Onboarding.swift
//  Cash App
//
//  Created by Cas on 15/06/2021.
//

import SwiftUI

struct PhoneNumberOnboardingView: View {
    @State private var phone : String = "0545179957"
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment:.leading) {
                HStack (alignment: .center, spacing: nil, content: {
                    Spacer()
                    Text("?")
                        .bold(size:24)
                })
                .padding()
                
                Text("Enter your phone number")
                    .medium(size: 25)
                    
                TextField("(+233) 54 517 9957",text: $phone)
                    .padding(.top, 5)
                    .font(.custom("CashMarket-RegularRounded", size:18))
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                
                
                if phone.count != 0 {
                    Text("By entering your phone number and tapping Next, you agree to the Terms")
                        .book(size: 17)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
                
                Spacer()
                
                HStack {
                    Button(action:{
                        withAnimation{
                        }
                    })
                    {
                        Text("Use Email")
                            .medium(size: 20)
                            .padding(15)
                            .foregroundColor(.white)
                            .frame(maxWidth:.infinity)
                        
                    }
                    .background(Color.gray)
                    .cornerRadius(30)
                    Spacer()
                    
                    NavigationLink(
                        destination: PostPhoneNumberView()
                    ) {
                        Text("Next")
                            .medium(size: 20)
                            .padding(15)
                            .foregroundColor(.white)
                            .frame(maxWidth:.infinity)
                    }
                    .background(Color.green)
                    .cornerRadius(30)
                }
                
                .padding(.bottom, 20)
            }
        }
        .padding(.horizontal,20)
    }
}

struct PhoneNumberOnboardingView_Previews: PreviewProvider {
    static var previews: some View {        
        PhoneNumberOnboardingView()
            .navigationBarHidden(true)
    }
}
