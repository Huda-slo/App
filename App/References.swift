import SwiftUI
import PDFKit

struct ReferencesPage: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("المراجع") // عنوان الصفحة
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    
                // قائمة بالمراجع، يمكن إضافة المزيد من الروابط هنا
                List {
                    NavigationLink(destination: PDFViewer(pdfURL: URL(string: "https://cdn.me-qr.com/pdf/5ac187c4-6248-432f-af52-c5d23e9e6d80.pdf")!)) {
                        Text(" الكتاب")
                    }
                    }
                }
            }
            .navigationTitle("المراجع") // عنوان شريط التنقل
        }
    }

struct PDFViewer: View {
    var pdfURL: URL

    var body: some View {
        PDFKitView(url: pdfURL)
            .edgesIgnoringSafeArea(.all)
    }
}

struct PDFKitView: UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        if let document = PDFDocument(url: url) {
            uiView.document = document
        }
    }
}

struct ReferencesPage_Previews: PreviewProvider {
    static var previews: some View {
        ReferencesPage()
    }
}
