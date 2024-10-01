//
//  Totorial Page1.swift
//  App
//
//  Created by Huda Almadi on 27/03/1446 AH.
//

import SwiftUI

struct Welcome_Page: View {
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("orange1"), Color("CustomOrangeBottom")]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                ZStack {
                    Image("logo1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    
                    Image("logo2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                        .offset(x: 50, y: -50)
                              
                }
                .padding(.bottom, 20)
                
                
                Text("اسمعك")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Spacer()
                
                
                
                HStack {
                    Image("Graphics")
                        .resizable()
                        .scaledToFill()
                        .frame(height: UIScreen.main.bounds.height * 0.35)
                        .clipped()
                    
    
                    
                }
                .padding([.leading, .trailing], 20)
                               .padding(.bottom, 30)
                
                
            }
        }
        
        
        
        
        
        
        
        
        
    }
    
}
       
#Preview {
    Welcome_Page()
}
