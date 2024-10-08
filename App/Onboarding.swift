//
//  OnboardingScreen.swift
//  App
//
//  Created by Arafat on 03/04/1446 AH.
//
//huda al




import SwiftUI

struct Onboarding: View {
    
    @AppStorage("currentPage") var currentPage=1
    
    var body: some View {
        
        if currentPage>totalPages{
            // Home()}
            landing3()}
       else {
            OnboardingScreen1()
       }
   }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        Onboarding()
    }
}
 //home screen
struct Home: View {
    var body: some View {
      VStack{
            Text("Welcome to Home Screen")
            .font(.title)
            .fontWeight(.heavy)
            Text("أسمعك")
            .font(.body)
              .fontWeight(.medium)
    
        
          
          
        }
        
   
        
    }
}
var totalPages=3
// OneBoardingScreen 1

struct OnboardingScreen1: View{
    
    @AppStorage("currentPage") var currentPage=1
    
    var body: some View {
        ZStack{
            
            if currentPage==1{
                ScreenView(gif:"wave", title:"تطبيق أسمعك",details:"",image: "waveImage")
    
              
            //if currentPage==1{
              //  ScreenView(image: "Hello", //title:"تطبيق أسمعك",details:"")
            }
            if currentPage==2{
               ScreenView(gif:"wave", title:"تعلم لغة الإشارة",details:"",image: "waveImage")
    
            
            
           // if currentPage==2{
            //    ScreenView(image: "stand", title:"تعلم لغة الإشارة",details:"")
            }
            if currentPage==3{
               ScreenView(gif:"wave", title:"أفهمك وتفهمني ",details:"",image: "waveImage")
    
               
          //  if currentPage==3{
           //     ScreenView(image: "ImageProfile", title:"أفهمك وتفهمني",details:"")
            }
        }
    }
}

struct ScreenView: View {
    @AppStorage("currentPage") var currentPage=1
    
    
    var gif: String
    var title: String
    var details: String
    var image: String
    
    var body: some View {
        
        
        // Display the image or GIF based on the input
                    if gif == "wave" {
                        // Use your GIF code here for "wave"
                        Gif(name: "wave")
                            .frame(width: 200, height: 150)
                            .edgesIgnoringSafeArea(.all)
                            .offset(x: 0, y: 2)
                            .scaleEffect(CGSize(width: 0.8, height: 0.7))
                    } else {
                        // Fallback to a regular image
                        Image(image)
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
        
        
        
        VStack{
            HStack{
                
                if currentPage==1{
                    Text("مرحبا بالمستمع")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning (1.4)
                }
                
                else{
                    Button(action: {
                        currentPage-=1
                    },label:{
                        Image (systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding (.horizontal)
                            .background (Color.black
                                .opacity (0.4))
                            .cornerRadius (10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    currentPage=4
                }, label: {
                    
                    Text("تخطي")
                    
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }.padding()
                . foregroundColor(.black)
            
            Spacer (minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio (contentMode: .fit) .padding(.horizontal, 16)
                .frame(height:300)
            Spacer (minLength: 80)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold) .kerning (1.2)
                .padding(.top)
                .padding(.bottom, 5)
                .foregroundColor (Color("orange1"))
            Text("نساعدك بتعلم لغة الإشارة بطريقة ممتعة وبسيطة")
                .font(.body)
                .fontWeight(.regular)
                .kerning(1.2)
                .padding([.leading, .trailing])
                .multilineTextAlignment(.center)
            
            Spacer (minLength: 0)
            
            HStack {
                
                if currentPage==1{
                    
                    Color("orange1").frame(height:8/UIScreen.main.scale)
                    Color.gray.frame (height:8/UIScreen.main.scale)
                    Color.gray.frame (height:8/UIScreen.main.scale)
                   
                }
                else if currentPage==2{
                    
                    Color.gray.frame(height:8/UIScreen.main.scale)
                    Color("orange1").frame(height:8/UIScreen.main.scale)
                    Color.gray.frame(height:8/UIScreen.main.scale)
                   
                }
                else if currentPage==3{
                    
                    Color.gray.frame(height:8/UIScreen.main.scale)
                    Color.gray.frame(height:8/UIScreen.main.scale)
                    Color("orange1").frame(height:8/UIScreen.main.scale)
                 
                }
        
}
.padding(.horizontal, 35)
            
            Button(action:{
                if currentPage<=totalPages{
                    currentPage+=1
                }
                else{
                    currentPage=1
                }
            }, label: {
                
                if currentPage==4 {
                    Text("ابدأ التعلم")
                        .fontWeight(.semibold)
                        .frame(minWidth:0, maxWidth:
                                .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background (Color("orange1"))
                        .cornerRadius(40)
                        .padding(.horizontal, 16)}
                
                
                else{
                    Text("التالي")
                        .fontWeight(.semibold)
                        .frame(minWidth:0, maxWidth:
                                .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background (Color("orange1"))
                        .cornerRadius(40)
                        .padding(.horizontal, 16)
                }
                
                
               
            })
            
            
            
        }
    }
}
