//
//  q1.swift
//  App
//
//  Created by Huda Almadi on 29/03/1446 AH.
//

import SwiftUI

struct q1: View {
    // State variables for progress and timer
    @State private var progress: Double = 1.0 // Starts at 100%
    @State private var timeRemaining: Double = 30 // Start with 30 seconds
    @State private var timer: Timer? = nil
    let totalTime: Double = 30 // Total time for the question (in seconds)
    
    let sectionTitle = "المدرسة" // Section title
    let questionText = "ما هو الاختيار الصحيح؟"
    let answers = ["كرسي", "طاولة", "جرس", "قلم"]
    
    var body: some View {
        VStack {
            // Section title at the top
            
            
            // Timer text and progress bar at the top
            VStack {
                // Display the remaining time in seconds
                Text("الوقت المتبقي: \(Int(timeRemaining)) ثانية")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                // Progress bar showing time progress
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: .green))
                    .padding()
            }
            .onAppear {
                startTimer()
            }
            
            // Question content
            VStack {
                
                Text(sectionTitle)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .trailing) // Aligns the text to the right
                    .padding(.top, 2)
                    .padding(.horizontal)
                
                // Question text
                Text(questionText)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                    .padding(.horizontal)
                
                Spacer()
                
                // Question image
                Image("Bell")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding()
                    .border(Color.orange, width: 3)
                
                Spacer()
                
                // Multiple-choice answers
                VStack(spacing: 15) {
                    ForEach(answers, id: \.self) { answer in
                        Button(action: {
                            // Handle the answer selection
                        }) {
                            Text(answer)
                                .font(.title3)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(radius: 3)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
            .background(Color.orange.opacity(0.1).edgesIgnoringSafeArea(.all))
        }
    }
    
    // Timer logic to decrease the progress and timeRemaining over time
    func startTimer() {
        // Invalidate any existing timer
        timer?.invalidate()
        
        // Create a new timer
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeRemaining > 0 {
                // Decrease time remaining and progress
                timeRemaining -= 1
                progress = timeRemaining / totalTime
            } else {
                // Stop the timer when time is up
                timer?.invalidate()
            }
            
        }
        
            }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        q1()
    }
}
