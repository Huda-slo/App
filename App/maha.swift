//
//  maha.swift
//  App
//
//  Created by maha on 28/03/1446 AH.
//

import SwiftUI
        
struct maha: View {
    var body: some View {
        
        
        
        ScrollView {
            VStack{
                ForEach(1..<11){ index in
                    
                    
                    ZStack {
                        Image("mn")
                        
                        
                        Text("\(index)")
                        
                        
                        
                        
                        
                    }
                    
                }
                
                
            }
                
                
                
            .frame(width: .infinity)
        }
        
        
        
//            VStack {
//
//
//                VStack {
//                    Image("mm")
//                        .imageScale(.large)
//                        .offset(x:30, y:-180)
//                        .padding(.all, 17.0)
//
//                    Text("1")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(0)
//                        .offset(x:-70, y:-350 )
//                        .padding(.all, 17.0)
//
//
//                    Image("mn")
//                        .imageScale(.large)
//                        .offset(x:30, y:-200)
//                        .padding(.all, 17.0)
//
//
//                    Text("2")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(0)
//                        .offset(x:-70, y:-338 )
//                        .padding(.all, 17.0)
//
//
//                    Image("mn")
//                        .imageScale(.large)
//                        .offset(x:90, y:-200)
//                        .padding(.all, 17.0)
//
//                    Text("3")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(0)
//                        .offset(x:-70, y:-350 )
//                        .padding(.all, 17.0)
//
//                    Image("mn")
//                        .imageScale(.large)
//                        .offset(x:-70, y:-200)
//                        .padding(.all, 17.0)
//
//                    Text("4")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(0)
//                        .offset(x:-70, y:-350 )
//                        .padding(.all, 17.0)
//
//                    Image("mn")
//                        .imageScale(.large)
//                        .offset(x:90, y:-200)
//                        .padding(.all, 17.0)
//                    Text("5")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(0)
//                        .offset(x:-70, y:-350 )
//                        .padding(.all, 17.0)
//
//                    Image("mn")
//                        .imageScale(.large)
//                        .offset(x:-70, y:-200)
//                        .padding(.all, 17.0)
//                    Text("6")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(0)
//                        .offset(x:-70, y:-350 )
//                        .padding(.all, 17.0)
//
//                    Image("mn")
//                        .imageScale(.large)
//                        .offset(x:90, y:-200)
//                        .padding(.all, 17.0)
//
//                    Text("7")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(0)
//                        .offset(x:-70, y:-350 )
//                        .padding(.all, 17.0)
//
//                    Image("mn")
//                        .imageScale(.large)
//                        .offset(x:-70, y:-200)
//                        .padding(.all, 17.0)
//
//                    Text("8")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(0)
//                        .offset(x:-70, y:-350 )
//                        .padding(.all, 17.0)
//
//                    Image("mn")
//                        .imageScale(.large)
//                        .offset(x:90, y:-200)
//                        .padding(.all, 17.0)
//
//                    Text("9")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(0)
//                        .offset(x:-70, y:-350 )
//                        .padding(.all, 17.0)
//
//                    Image("mn")
//                        .imageScale(.large)
//                        .offset(x:-70, y:-200)
//                        .padding(.all, 17.0)
//
//                    Text("10")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.leading)
//                        .lineLimit(0)
//                        .offset(x:-70, y:-350 )
//                        .padding(.all, 17.0)
//                }
//            }
            
        }
        
        
    }
    
    
    
//}


#Preview {
    maha()
}
