
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // الصفحة الأولى (خريطة المستويات)
           
            
            // الصفحة الثانية (الملف الشخصي)
            Profilepage1()
                .tabItem {
                    Image(systemName: "person.fill")  // أيقونة الصفحة الثانية
                    Text("الملف الشخصي")             // النص أسفل الأيقونة
                }
            Home1Map()
                .tabItem {
                    Image(systemName: "map.fill")  // أيقونة الصفحة الأولى
                    Text("الخريطة")                // النص أسفل الأيقونة
                }
            
            // الصفحة الثالثة (الإعدادات)
            profile()
                .tabItem {
                    Image(systemName: "gearshape.fill")  // أيقونة الصفحة الثالثة
                    Text("الإعدادات")  
                    
                    //
                    //  profile.swift
                    //  App
                    //
                    //  Created by Bayan Alshuwaier on 01/10/2024.
                    //



// النص أسفل الأيقونة
                }
        }
        .accentColor(.orange) // لون الأيقونات عند اختيار التبويب
    }
}

#Preview {
    MainTabView()
}


#Preview {
    MainTabView()
}
