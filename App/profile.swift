//
//  profile.swift
//  App
//
//  Created by Bayan Alshuwaier on 01/10/2024.
//

import SwiftUI
struct FontSizeKey: EnvironmentKey { static let defaultValue: CGFloat = 14}


struct profile: View {
    @State private var volume: Double = 0
    @State private var fontSize: Int = 14
    @State var settingsPage = false
    var body: some View {
        VStack{
            Image(systemName:"fireworks")
                .font(.system(size: 100))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.orange, .pink )
                
            Spacer()
            Button("الإعدادات"){settingsPage.toggle()}
            
            
            
                .sheet(isPresented: $settingsPage,
                       content: {
                    settingsPageView()
                        .presentationDetents([.medium, .large])
                })
            
            
        }
    }
    struct settingsPageView: View {
        @State private var volume: Double = 0
        @State private var fontSize: Int = 14
        @State var settingsPage = false
        var body: some View {
            VStack{
                Spacer()
                Text("حجم الخط")
                    .font(.system(size: CGFloat(fontSize)))
                Picker(selection: $fontSize, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                    Text("صغير").tag(12)
                    Text("وسط").tag(14)
                    Text("كبير").tag(15)
                    Text("كبير جدًا").tag(16)
                        .pickerStyle(SegmentedPickerStyle())
                }
                
                Spacer()
                Text("مستوى الصوت")
                Slider(value: $volume, in: 0...100)
                    .frame(width: 250, height: 30)
                    .accentColor(.orange1)
                Spacer()
                
                
            }
        }
    }}
    #Preview {
        profile()
    }

