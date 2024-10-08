import SwiftUI

struct MainTabView: View {

    var body: some View {
        TabView {
            // الصفحة الأولى (خريطة المستويات)
            Home1Map()
                .tabItem {
                    Image(systemName: "map.fill")  // أيقونة الصفحة الأولى
                    Text("الخريطة")                // النص أسفل الأيقونة
                }
            
            // الصفحة الثانية (الملف الشخصي)
            Profilepage1()
                .tabItem {
                    Image(systemName: "person.fill")  // أيقونة الصفحة الثانية
                    Text("الملف الشخصي")             // النص أسفل الأيقونة
                }
            
            // الصفحة الثالثة (المراجع)
            ReferencesPage() // استبدال الصفحة بالإعدادات
                .tabItem {
                    Image(systemName: "gearshape.fill")  // أيقونة الصفحة الثالثة
                    Text("الإعدادات")
                    
                


                }
        }
        .accentColor(.orange) // لون الأيقونات عند اختيار التبويب
    }
}


#Preview {
    MainTabView()
}

