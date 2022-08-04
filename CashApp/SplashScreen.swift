//
//  SplashScreen.swift
//  CashApp
//
//  Created by Cas on 18/06/2021.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive: Bool = true
    
    var body: some View {
        VStack {
            if self.isActive {
                HomeView()
            } else {
                GeometryReader { geometry in
                    VStack{
                        Text("Cash App").foregroundColor(Color.white).medium(size:50)
                    }
                    .background(Color.accentColor)
                    .frame(width: geometry.size.width, height:geometry.size.height)
                    
                }
                .edgesIgnoringSafeArea(.vertical)
                .background(Color.accentColor)
            }
        }
        .edgesIgnoringSafeArea(.vertical)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}




struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
