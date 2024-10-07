import SwiftUI

struct Profilepage1: View {
    @State private var showingPopover = false
    
    var body: some View {
        VStack {
    
            ZStack{
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .fill(Color.orange2)
                    .frame(height: 350)
                
                    .overlay(
                        VStack(spacing: 20) {
                            Text("الملف الشخصي")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            
                            
                            
                            Image("profile pic")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            
                            
                            Text("اسم اللاعب")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("الهدف")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(.bottom, 5)
                            
                            Text("Hi players, I'm from Los Angeles and I love playing soccer and car racing games with fellow players. Let's connect!")
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                        
                            
                        }
                    )
                  
            }
            
            HStack(spacing: 40) {
                VStack {
                                    Text("المستوى")
                                        .font(.title3)
                                        .foregroundColor(.orange)
                                    Text("10")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.yellow)
                                }
                
                VStack {
                                    Text("الاشتراك")
                                        .font(.title3)
                                        .foregroundColor(.orange)
                                    Text("98")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.yellow)
                                }
                VStack {
                                    Text("النقاط")
                                        .font(.title3)
                                        .foregroundColor(.orange)
                                    Text("67")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.yellow)
                                }
                
            }
            .padding(.top, 10)
            
            Spacer()
            
            HStack(spacing: 40) {
                VStack {
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.orange)
                    
                    Text("ستريك")
                        .font(.title3)
                        .foregroundColor(.orange)
                    
                    Text("4")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                    
                }
                
                VStack {
                    Image("read")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.orange)
                    
                    Text("المستوى")
                        .font(.title3)
                        .foregroundColor(.orange)
                                        

                    Text("2")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                    
                    
                }
                
                VStack {
                    Image("success")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.orange)
                                            
                    Text("المرحلة")
                        .font(.title3)
                        .foregroundColor(.orange)
                                            
                    Text("1")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                    
                }
                
                
                
                        }
            .padding(.top, 10)
            
            Spacer()
            VStack {
                Button(action: {
                    showingPopover = true
                }) {
                    Text("تعديل الملف الشخصي")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange2)
                        .cornerRadius(25)
                }
                .sheet(isPresented: $showingPopover) {

                    ProfilePopup()
                }
            }
            
        }
        
        
        .padding()
    }
}


#Preview {
    Profilepage1()
}
