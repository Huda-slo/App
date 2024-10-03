//
//  ViewTwo.swift
//  App
//
//  Created by Reem on 26/03/1446 AH.
//

// تعريف

import SwiftUI

struct landing1: View {
    var body: some View {
        
        VStack {
            Image( "image5")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Spacer()
            
            VStack(alignment: .leading) {
                Text("إختر شخصيتك في ")
                    .font(.title)
                    .foregroundColor(.orange1)
                Text("أسمعك")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.orange1)
                    .multilineTextAlignment(.leading)
                
                
             
            Spacer()
                
                
            }
        }
    }
}
                     
                     
                 
            
        
    
                     #Preview {
                         landing1()
                     }
