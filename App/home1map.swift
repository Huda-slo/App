import SwiftUI

struct Home1Map: View {
    var body: some View {
        NavigationView {
            ZStack {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color("orange1"), Color("CustomOrangeBottom")]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                }
                // Scrollable content
                ScrollView {
                    ZStack {
                        // Background padding for scrollability
                        Color.clear
                            .frame(height: 3700) // Ensures enough height for scrolling

                        // Displaying circles in a random layout with spacing
                        LevelCircle(level: "١", levelNumber: 1)
                            .offset(x: -100, y: 50)
                        LevelCircle(level: "٢", levelNumber: 2)
                            .offset(x: 120, y: 160) // Adjusted horizontal and vertical spacing
                        LevelCircle(level: "٣", levelNumber: 3)
                            .offset(x: -80, y: 280) // Increased vertical space
                        LevelCircle(level: "٤", levelNumber: 4)
                            .offset(x: 140, y: 400)
                        LevelCircle(level: "٥", levelNumber: 5)
                            .offset(x: -120, y: 520)
                        LevelCircle(level: "٦", levelNumber: 6)
                            .offset(x: 130, y: 640)
                        LevelCircle(level: "٧", levelNumber: 7)
                            .offset(x: -90, y: 760)
                        LevelCircle(level: "٨", levelNumber: 8)
                            .offset(x: 140, y: 880)
                        LevelCircle(level: "٩", levelNumber: 9)
                            .offset(x: -100, y: 1000)
                        LevelCircle(level: "١٠", levelNumber: 10)
                            .offset(x: 110, y: 1120)
                        LevelCircle(level: "١١", levelNumber: 11)
                            .offset(x: -70, y: 1240)
                        LevelCircle(level: "١٢", levelNumber: 12)
                            .offset(x: 130, y: 1360)
                        LevelCircle(level: "١٣", levelNumber: 13)
                            .offset(x: -120, y: 1480)
                        LevelCircle(level: "١٤", levelNumber: 14)
                            .offset(x: 100, y: 1600)
                        LevelCircle(level: "١٥", levelNumber: 15)
                            .offset(x: -80, y: 1720)
                        LevelCircle(level: "١٦", levelNumber: 16)
                            .offset(x: 130, y: 1840)
                    }
                    .frame(minHeight: 2000) // Ensure enough height for content
                    .padding(.bottom, 150) // Space for navigation bar and scrollability
                }

                // Fixed bottom navigation bar
                VStack {
                    Spacer() // Pushes the HStack to the bottom
                    HStack {
                        
                                               
                    }
                    .padding(.bottom, 20) // Spacing from the bottom of the screen
                    .background(Color.clear) // Keep the background clear to see the gradient
                }
            }
        }
    }
}

// Circular level buttons with Arabic numerals
struct LevelCircle: View {
    var level: String
    var levelNumber: Int // To identify which level was tapped

    var body: some View {
        NavigationLink(destination: LearningView(levelNumber: levelNumber)) {
            ZStack {
                Circle()
                    .fill(levelNumber == 1 ? Color.orange2 : Color.gray) // First circle orange, others gray
                    .frame(width: 100, height: 100)
                    .shadow(radius: 5)
                Text(level)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
        }
        .buttonStyle(PlainButtonStyle()) // Remove default button styling
    }
}

// Learning page for the selected level
struct LearningView: View {
    var levelNumber: Int

    var body: some View {
        VStack {
            Text("Learning Page for Level \(levelNumber)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            // Add your learning content here
            Spacer()
        }
        .navigationBarTitle("Level \(levelNumber)", displayMode: .inline)
        .padding()
    }
}

// Preview for the SwiftUI canvas
struct GameMapView_Previews: PreviewProvider {
    static var previews: some View {
        Home1Map()
    }
}
