import SwiftUI

// Main View
struct Home1Map: View {
    // Coordinates for each circle (x, y) to be centered
    let circlePositions: [(x: CGFloat, y: CGFloat)] = [
        (-80, 50), (80, 160),
        (-80, 260), (80, 360),
        (-80, 460), (80, 560),
        (-80, 660), (80, 760),
        (-80, 860), (80, 960),
        (-80, 1060), (80, 1160),
        (-80, 1260), (80, 1360),
        (-80, 1460), (80, 1560)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("orange1"), Color("CustomOrangeBottom")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 0) {
                        ZStack {
                            // Dashed lines connecting the circles
                            DashedLineShape(positions: circlePositions)
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                .foregroundColor(.black)
                                .frame(height: 200) // Ensure enough height for the entire layout
                            
                            // Draw each circle at its respective position
                            ForEach(0..<circlePositions.count, id: \.self) { index in
                                let position = circlePositions[index]
                                LevelCircle(level: "\(index + 1)", levelNumber: index + 1)
                                    .offset(x: position.x, y: position.y)
                            }
                        }
                        .frame(height: 100) // Set the height of the ZStack to give space for scrolling

                        // Adding a spacer to fill space below the circles
                        Spacer(minLength: 1500) // Adjust this length as needed for additional space
                    }
                    .padding(.bottom, 20) // Optional: add some padding at the bottom
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// Custom Shape to draw dashed lines connecting the circles
struct DashedLineShape: Shape {
    var positions: [(x: CGFloat, y: CGFloat)] // Array of circle positions
    let xOffset: CGFloat = 30 // Adjust this to move the dashed line to the right
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Draw lines connecting each pair of circles
        for i in 1..<positions.count {
            let previousPosition = positions[i - 1]
            let currentPosition = positions[i]

            // Adjust the x-offset to move the dashed line to the right
            let startPoint = CGPoint(x: previousPosition.x + 140 + xOffset, y: previousPosition.y + 100)
            let endPoint = CGPoint(x: currentPosition.x + 140 + xOffset, y: currentPosition.y + 100)

            path.move(to: startPoint)
            path.addLine(to: endPoint)
        }
        
        return path
    }
}

// Circular level buttons with Arabic numerals
struct LevelCircle: View {
    var level: String
    var levelNumber: Int // To identify which level was tapped

    var body: some View {
        NavigationLink(destination: LearningView(levelNumber: levelNumber)) {
            ZStack {
                if levelNumber == 1 {
                    // Unique look for Circle 1 using a striped pattern
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.red, Color.orange]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.5), lineWidth: 5) // Outline
                        )
                        .frame(width: 100, height: 100)
                        .shadow(color: .yellow, radius: 5, x: 0, y: 0) // Adding a shadow
                } else {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 100, height: 100)
                        .shadow(radius: 5)
                }

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
        .navigationTitle("Level \(levelNumber)") // Set the navigation title
        .padding()
    }
}

// Questions page
struct Questions: View {
    var body: some View {
        VStack {
            Text("Questions Page")
                .font(.largeTitle)
                .padding()
            
            // Add your questions content here
            Spacer()
        }
        .navigationTitle("Questions") // Set the navigation title
        .padding()
    }
}

// Preview for the SwiftUI canvas
struct Home1Map_Previews: PreviewProvider {
    static var previews: some View {
        Home1Map()
    }
}


