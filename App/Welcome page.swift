//
//  Totorial Page1.swift
//  App
//
//  Created by Huda Almadi on 27/03/1446 AH.
//

import SwiftUI

struct Welcome_Page: View {
    @State private var moveLogo1 = false
    @State private var moveLogo2 = false
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            
            OnboardingScreen()
        } else {
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("orange1"), Color("CustomOrangeBottom")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        Image("logo1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 150)
                            .offset(x: -15, y: moveLogo1 ? -20 : 4)
                        
                            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: moveLogo1)
                            .onAppear {
                                moveLogo1.toggle()
                            }
                        
                        
                        Image("logo2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 90)
                            .offset(x: 90, y: moveLogo2 ? -70 : -10)
                        
                            .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: moveLogo2)
                            .onAppear {
                                moveLogo2.toggle()
                            }
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
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.isActive = true
                }
                
            }
        }
    }
}

#Preview {
    Welcome_Page()
}
