//
//  splash_page.swift
//  App
//
//  Created by Arafat on 05/04/1446 AH.
//



import SwiftUI


struct splash_page: View {
    
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                Onboarding()
            } else {
                
                
                
                Gif(name: "wave")
                    .frame(width: 200, height: 200)
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: 0,y: 0)
                    .scaleEffect(CGSize(width: 0.8, height: 0.8))
                // Move the GIF up by 50 points
                
                
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
    

    #Preview {
        splash_page()
    }
