//
//  ContentView.swift
//  App
//
//  Created by Huda Almadi on 27/03/1446 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image( "image4")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Spacer()
        }
        ZStack{
            Button(action: {
                
            }, label: {
                Text("إبدأ التعلم")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.orange1)
                    .frame(width: 200.0, height: 50.0)
                    .cornerRadius(25)
                    .padding()
            })
            
        }
    }
    
}
    
    #Preview {
    
    ContentView()
}



