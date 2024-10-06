//
//  ContentView.swift
//  App
//
//  Created by Huda Almadi on 27/03/1446 AH.
//
import SwiftUI

// Main Player Profile View
struct landing3: View {
    @State private var playerName: String = ""
    @State private var goal: String = ""
    @State private var selectedImage: Image? = nil
    @State private var isImagePickerPresented: Bool = false
    @State private var inputImage: UIImage?

    var body: some View {
        NavigationView {
            VStack {
                // Profile Picture
                if let image = selectedImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.orange2, lineWidth: 2))
                        .padding()
                } else {
                    Button(action: {
                        isImagePickerPresented = true
                    }) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.orange2, lineWidth: 2))
                            .padding()
                    }
                    Spacer()
                }

                // Name and Goal Input Fields
                VStack(alignment: .trailing, spacing: 20) {
                    HStack {
                        Spacer()
                        Text("الاسم")
                            .foregroundColor(.black)
                        TextField("اسم اللاعب", text: $playerName)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange2))
                            .multilineTextAlignment(.trailing)
                    }

                    HStack {
                        Spacer()
                        Text("الهدف")
                            .foregroundColor(.black)
                        TextField("الهدف", text: $goal)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange2))
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding(.horizontal)

                Spacer()

                // Save Button (NavigationLink to Home1Map)
                NavigationLink(destination: Home1Map()) { // Replace with your actual Home1Map view
                    Text("حفظ")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange2)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 50)

                Spacer()
            }
            .sheet(isPresented: $isImagePickerPresented, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
            .background(Color.background1.edgesIgnoringSafeArea(.all))
            .navigationTitle("معلومات اللاعب")
            .foregroundColor(Color.orange2)
            
          
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        selectedImage = Image(uiImage: inputImage)
    }
}

// ImagePicker for selecting an image
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct PlayerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        landing3()
    }
}
