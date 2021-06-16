//
//  ContentView.swift
//  Cash App
//
//  Created by Cas on 15/06/2021.
//

import SwiftUI

struct ContentView: View {
//    @Binding var phone : String?
    
    var body: some View {
        VStack{
            Text("Hello, world!")
                .padding()
                .font(.custom("CashMarket-RegularRounded", size: 20))
            
//            Text("\(phone ??  "")")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
