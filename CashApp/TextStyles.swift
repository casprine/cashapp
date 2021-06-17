//
//  TextStyles.swift
//  Cash App
//
//  Created by Cas on 15/06/2021.
//


import SwiftUI

extension Text {
    
    func bold(size:CGFloat) -> some View {
        self.font(.custom("CashMarket-BoldRounded", size:size))
    }
    
    func medium(size:CGFloat) -> some View  {
        self.font(.custom("CashMarket-MediumRounded",size:size))
    }
    
    
    func book(size:CGFloat) -> some View  {
        self.font(.custom("CashMarket-RegularRounded",size:size))
    }
    
}

