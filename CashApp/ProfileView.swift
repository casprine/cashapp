//
//  ProfileView.swift
//  CashApp
//
//  Created by Cas on 19/06/2021.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack{
                    Spacer()
                    ZStack {
                        Button(action:{
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "xmark")
                                .font(.system(size:22, weight:.bold ))
                                .foregroundColor(Color.black)
                        }
                    }.padding()
                }
                
            }
            
            ScrollView (showsIndicators: false) {
                VStack(spacing:10){
                    HStack{
                        Image(systemName: "qrcode")
                            .font(.system(size:22, weight:.bold ))
                            .foregroundColor(Color.black)
                        Spacer()
                    }
                    .frame(width: geometry.size.width)
                    .padding()
                    .padding(.leading, 20)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "camera.fill")
                            .font(.system(size: 18))
                            .foregroundColor(Color.white)
                    }
                    
                    .frame(width:50, height:50)
                    .background(Color.accentColor)
                    .cornerRadius(25)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(style:
                                        StrokeStyle(lineWidth: 3, lineCap: .round ,dash: [7])
                                   )
                            .foregroundColor(Color.accentColor)
                    )
                    Text("Casprine Assempah")
                        .medium(size: 34)
                    Text("$casprine")
                        .book(size: 23)
                        .foregroundColor(Color("gray.400"))
                    
                    HStack{
                        Button(action:{
                            withAnimation{
                            }
                        }){
                            Text("Invite Friends, Get $15")
                                .medium(size: 18)
                                .frame(maxWidth:.infinity)
                                .padding(.vertical, 15)
                                .foregroundColor(Color.white)
                        }
                        .background(Color("green"))
                        .cornerRadius(30, antialiased: true)
                    }.padding()
                    
                    HStack{
                        Image(systemName: "calendar")
                            .padding(.leading, 20)
                            .font(.system(size: 18))
                            .foregroundColor(Color.accentColor)
                        
                        Text("Joined November 2020")
                            .medium(size: 18)
                            .padding(.leading, 10)
                            .foregroundColor(Color("gray.800"))
                        
                        Spacer()
                        
                    }
                    .frame(width:geometry.size.width)
                    .padding()
                    
                    Divider()
                    
                    VStack{
                        NavLink(title:"Personal", icon:"person.fill")
                        NavLink(title:"Support", icon:"questionmark.circle.fill")
                        NavLink(title:"Privacy & Security", icon:"checkmark.shield.fill")
                        NavLink(title:"Notifications", icon:"moon.circle")
                        NavLink(title:"Documents", icon:"doc.fill")
                    }
                    
                    VStack(alignment:.center){
                        
                        Button(action:{
                            withAnimation{
                                
                            }
                        }) {
                            Text("Sign Out")
                                .medium(size: 18)
                                .frame(maxWidth:.infinity)
                                .padding(.vertical, 20)
                        }
                        .background(Color.white)
                        .frame(width:geometry.size.width)
                        
                        
                        
                        Text("Sqaure, Inc.'s Privacy Policy, Terms of Service,\nand Open Source Software")
                            .book(size:15)
                            .multilineTextAlignment(.center)
                            .padding(.top, 20)
                            .foregroundColor(Color("gray.700"))
                        
                        

                    }
                    .padding(.vertical, 50)
                    .frame(width:geometry.size.width)
                    .background(Color("gray.100"))

                }
                .frame(width:geometry.size.width)

            }
        }
    }
}


struct ProfileIcon:View {
    @State private var showProfileModal = false
    
    var body: some View {
        
        Button(action: {
            withAnimation{
                showProfileModal.toggle()
            }
        }) {
            Image(systemName: "person.crop.circle")
                .foregroundColor(Color("gray.800"))
                .font(.system(size: 30))
        }
        .fullScreenCover(isPresented:$showProfileModal, content: ProfileView.init)
    }
}




struct NavLink: View {
    var title:String
    var icon : String
    
    
    var body: some View {
        HStack{
            Button(action:{
                withAnimation{
                    
                }
            }) {
                HStack(alignment:.bottom){
                    Image(systemName: icon)
                        .padding(.leading, 5)
                        .font(.system(size: 18))
                        .foregroundColor(Color("gray.800"))
                    
                    
                    Text("\(title)")
                        .medium(size: 18)
                        .padding(.leading, 15)
                        .foregroundColor(Color("gray.800"))
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size:15, weight:.bold))
                        .foregroundColor(Color("gray.400"))
                }
                .padding()
            }
        }
        .padding(.vertical, 5)
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

