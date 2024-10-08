import SwiftUI

struct GreatJob: View {
    @State private var showingSheet = false

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    showingSheet = true
                }) {
                    Text("فتح الشيت")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.trailing, 20)
                .padding(.top, 20)
            }
            Spacer()
        }
        .sheet(isPresented: $showingSheet) {
            SuccessSheet(showingSheet: $showingSheet)
        }
    }
}

struct SuccessSheet: View {
    @Binding var showingSheet: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    showingSheet = false
                }) {
                    Spacer()
                        .padding(.top, 40)
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                        .padding(.top, 40)
                }
                Spacer()
            }
            
            
                .padding(.top, 40)
            
            Text("أحسنت")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.orange2)
              
            Image(systemName:"fireworks")
                .font(.system(size: 150))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.orange, .pink )

            

         
            Text("لقد أتممت المرحلة بنجاح")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.orange2)
          

            Image("Image6")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
             
            
           


            Button(action: {
                print("الانتقال للمرحلة التالية")
            }) {
                Text("الانتقال للمرحلة التالية")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange2)
                    .cornerRadius(25)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 80)
        }
    }
}

#Preview {
    GreatJob()
}
