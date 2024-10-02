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
                .padding(.trailing, 20) // محاذاة الزر إلى اليمين
                .padding(.top, 20) // محاذاة الزر إلى الأعلى
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
        VStack{
            Spacer()
            Text("أحسنت")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.background)
                .lineLimit(1)
                .padding(.vertical, 20)
            
            
            
        }
        VStack {

            HStack {
                Spacer()
                Button(action: {
                    showingSheet = false 

                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)

                }
                .padding(.trailing, 20) 

                .padding(.top, 20)

            }
            
            Spacer()
            

            Image("ImageGood")

                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(.green) 


            Text("لقد أتممت المرحلة بنجاح")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.background)
                .padding(.top, 20)


            Image("Image6") 

                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .foregroundColor(.yellow)

                .padding(.top, 20)
            
            Spacer()


            Button(action: {
                print("الانتقال للمرحلة التالية")
            }) {
                Text("الانتقال للمرحلة التالية")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.background)
                

                    .cornerRadius(25)
            }
            .padding(.horizontal, 40) 

            .padding(.bottom, 40)

            
        }
    }
}

#Preview {
    GreatJob()
}

