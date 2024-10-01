//
//  Profile page1.swift
//  App
//
//  Created by Huda Almadi on 28/03/1446 AH.
//

import SwiftUI

struct Profile_page1: View {
    var body: some View {
        
        ZStack {
            Color.orange2
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("الملف الشخصي")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.trailing, 20)
                
                
                Image( "profile pic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150.0)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 10)
                    .padding(.top, 10)
                
                Spacer()
                
                
            }
            
           
            
        }
        
            
    }
}

#Preview {
    Profile_page1()
}
