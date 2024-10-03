import SwiftUI

struct Profile_page2: View {
    @State private var showingPopover = false
    
    var body: some View {
        VStack {
            Button(action: {
                showingPopover = true
            }) {
                Text("تعديل الملف الشخصي")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)

                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showingPopover) {

                ProfilePopup()
            }
        }
    }
}

struct ProfilePopup: View {
    @State private var playerName: String = ""
    @State private var playerGoal: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("تعديل الملف الشخصي")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.trailing)
                    .frame(width: 300, height: 100)
            }

            VStack {
                Image("ImageProfile")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .overlay(Circle().stroke(Color.orange2, lineWidth: 4))

                VStack(alignment: .trailing) {
                    Text("الإسم")
                        .font(.title3)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing, 20)

                    TextField("اسم اللاعب", text: $playerName)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange2, lineWidth: 2))
                        .padding(.horizontal, 20)

                    Text("الهدف")
                        .font(.title3)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing, 20)
                        .padding(.top, 10)

                    TextField("الهدف", text: $playerGoal)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange2, lineWidth: 2))
                        .padding(.horizontal, 20)

                    HStack {
                        Button(action: {
                            print("تم حفظ البيانات: \(playerName), \(playerGoal)")
                        }) {
                            Text("حفظ")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)

                                .background(Color.orange2)
                                .cornerRadius(25)
                        }

                        Button(action: {
                            print("تم إلغاء التعديلات")
                        }) {
                            Text("إلغاء")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)

                                .background(Color.gray)
                                .cornerRadius(25)
                        }
                    }
                    .padding(.top, 20) 

                    .padding(.horizontal, 40)

                }
                .padding(.top, 20)
            }
            .padding(.top, 20)
        }
    }
}

#Preview {
    Profile_page2()
}
