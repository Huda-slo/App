//
//  TabBarApp.swift
//  App
//
//  Created by Reem on 03/04/1446 AH.
//

import SwiftUI

struct TabBarApp: View {
    var body: some View {
        TabView{
            
        
 FirstView()
            .tabItem {
                Image(systemName: "String")
                Task("1st")
            }
        SecondView()
            .tabItem{
                Image(systemName: "")
                Task("2nd")
            }
        
        Th
    }
}
    static TabBarApp_Previews:pa
#Preview {
    TabBarApp()
}
