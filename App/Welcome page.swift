import SwiftUI

struct Welcome_Page: View {
    @State private var moveLogo1 = false
    @State private var moveLogo2 = false
    @State private var isActive = false

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
                        .frame(width: 200, height: 150)
                        .offset(x: -15, y: moveLogo1 ? -20 : 4)
                        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: moveLogo1)
                        .onAppear {
                            moveLogo1.toggle()
                        }
                    
                }

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
            // بعد 3 ثواني، انتقل إلى صفحة Onboarding
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isActive = true
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            Onboarding() // عرض صفحة Onboarding بعد انتهاء الانتظار
        }
    }
}

#Preview {
    Welcome_Page()
}
