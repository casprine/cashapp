//
//  EmailConfirmationView.swift
//  Cash App
//
//  Created by Cas on 16/06/2021.
//

import SwiftUI

struct EmailConfirmationView: View {
    @Binding var phoneNumber: String
    @State private var secretCode : String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading) {
                HStack (alignment: .center, spacing: nil, content: {
                    Spacer()
                    Text("?")
                        .bold(size:20)
                })
                

                Text("Please enter the code sent to \(phoneNumber)")
                    .medium(size: 21)
                
                TextField("Confirmation Code",text: $secretCode)
                    .font(.custom("CashMarket-RegularRounded", size:17))
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                
                
                
                Spacer()
                
                
            }.padding()
        }
        .navigationBarHidden(true)
    }
}

//struct EmailConfirmationView_Previews: PreviewProvider {
//    @State var phone : String = ""
//    static var previews: some View {
//        EmailConfirmationView(phoneNumber: $phone)
//    }
//}
