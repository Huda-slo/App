//
//  maha.swift
//  App
//
//  Created by maha on 28/03/1446 AH.
//

import SwiftUI
        
        struct maha: View {
            var body: some View {
                
                
                
                VStack {
                    SwiftUI.Image("Image")
                        .imageScale(.large)
                        .offset(x:-70, y:-250 )
                    .padding(.all, 17.0) }
                
                Text("1")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(0)
                    .offset(x:-70, y:-338 )
                .padding(.all, 17.0) }
   
}

#Preview {
    maha()
}
