//
//  Profile page2.swift
//  App
//
//  Created by Reem on 28/03/1446 AH.
//

import SwiftUI

struct Profile_page2: View {
    var body: some View {
        
            VStack{
                HStack{
                    Text("تعديل الملف الشخصي")
                    
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.background)
                        .multilineTextAlignment(.trailing)
                    .frame(width:300 , height: 100)}
            
                
                VStack {
                    
                    
                    Image("ImageProfile")
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 100, height: 100)
                        .overlay(Circle().stroke(Color.background,
                                                 lineWidth: 4))

                    
                        Text("الإسم")
                            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.background)
                            .multilineTextAlignment(.trailing)
                        .padding(.leading, 250)
                    
                    TextField("اسم الاعب ", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 280)

                    Spacer()
                   
                }
            }
        }
    }

    
        #Preview {
            Profile_page2()
        }
