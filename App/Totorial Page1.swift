//
//  Totorial Page1.swift
//  App
//
//  Created by Huda Almadi on 27/03/1446 AH.
//

import SwiftUI

struct Totorial_Page1: View {
    var body: some View {
                
                VStack {
                    Image( "Tutotial1")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Spacer()
                    
                    
                    VStack(alignment: .leading) {
                        Text("مرحبا بك في")
                                .font(.title)
                                .foregroundColor(.orange1)
                        
                        Text("اسمعك")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.orange1)
                        Spacer()
                        
                        
                        
                    }
                    
                }
                
                    
            }
        }

       
#Preview {
    Totorial_Page1()
}
