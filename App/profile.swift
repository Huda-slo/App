//
//  profile.swift
//  App
//
//  Created by Bayan Alshuwaier on 01/10/2024.
//

import SwiftUI

struct profile: View {
    @State private var volume: Double = 0
    var body: some View {
        Text("مستوى الصوت")
        Slider(value: $volume, in: 0...100)
            .accentColor(.orange1)
            
            
            
    }
}

#Preview {
    profile()
}
