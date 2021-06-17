//
//  InviteContactsView.swift
//  CashApp
//
//  Created by Cas on 17/06/2021.
//

import SwiftUI
import Foundation
import Contacts


struct InviteContactsView: View {
    @ObservedObject var contactsModel = ContactsViewModel()
    
    

    var body: some View {
        GeometryReader{ geometry in
            VStack (alignment:.leading) {
                HStack (alignment: .center, spacing: nil, content: {
                    Spacer()
                    Image(systemName:"xmark").font(.system(size:20))
                })
                .padding()

                
                    VStack (alignment:.leading){
                        VStack(alignment:.leading){
                            HStack{
                                Image(systemName: "person.2.fill")
                                    .foregroundColor(.white)
                                    .padding()
                                    .font(.system(size:14))
                                
                            }
                            .background(Color("green"))
                            .frame(width: 40, height: 40)
                            .cornerRadius(50)
                            
                            Text("Text Friends and Get $15 each")
                                .medium(size:25)
                                .padding(.top, 5)
                        }
                        .padding(.horizontal, 20)
                        
          
                        if contactsModel.noPermission {
                                Text("Allow Contact Access to \neasily invite your friends")
                                    .book(size: 18)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal,20)
                                    .padding(.top, 5)
                            Footer()
                        } else {
                            SearchForm()
                            ContactListView()
                        }
                        
                    }
                }
            }
    }
}


struct Footer: View  {
    @ObservedObject var contactsModel = ContactsViewModel()
    
    
    var body: some View {
        VStack(spacing:12){
            Spacer()
            
            Button(action:{
                withAnimation{
                    contactsModel.fetch()
                }
            }){
                Text("Skip")
                    .medium(size: 18)
                    .frame(maxWidth:.infinity)
                    .padding(.vertical, 15)
                    .foregroundColor(Color("gray.800"))
            }
            .background(Color("gray.200"))
            .cornerRadius(30, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            Button(action:{
                withAnimation{
                    contactsModel.fetch()
                }
            }){
                Text("Continue")
                    .medium(size: 18)
                    .frame(maxWidth:.infinity)
                    .padding(.vertical, 15)
                    .foregroundColor(Color.white)
            }
            .background(Color("green"))
            .cornerRadius(30, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            
        }
        .padding()
    }
}



struct SearchForm: View {
    @State private var searchValue : String  = ""
    var body: some View{
        HStack{
            Text("To:")
                .medium(size:17)
            TextField("Name, Phone, or Email", text:$searchValue)
                .padding(.leading, 2)
                .font(.system(size:17))
                .ignoresSafeArea(.keyboard, edges: .bottom)
                .foregroundColor(Color("gray.400"))
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
        
    }
}

struct ContactListView: View  {
    var body: some View{
        VStack(alignment:.leading){
            
            Text("CONTACTS")
                .medium(size: 11)
                .foregroundColor(Color("gray.400"))
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            
            ScrollView{
                ForEach(0..<20){ index in
                        ContactView()
                }
            }.background(Color.white)
        }
        .background(Color("gray.100"))
        
    }
}


struct ContactView: View {
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text("David Manor").medium(size: 18)
                Text("(233) 545 1799 57").book(size: 13).foregroundColor(Color("gray.400"))
                    .padding(.top,1)
            }
            
            Spacer()
            
            Button(action:{
                withAnimation{
                    
                }
            }){
                Text("Get $15")
                    .foregroundColor(.white)
                    .medium(size: 16)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
            }
            .background(Color("green"))
            .cornerRadius(20)
            
        }
        .background(Color.white)
        .padding(.top, 5)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}



struct InviteContactsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            InviteContactsView()
                .navigationBarHidden(true)
        }
        
    }
}
