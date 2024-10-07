//
//  Questions.swift
//  App
//
//  Created by Bayan Alshuwaier on 02/10/2024.
//

import SwiftUI

struct Question {
    let imageName: String
    let correctAnswer: String
    let options: [String]
}

class QuizViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var currentQuestionIndex: Int = 0
    @Published var score: Int = 0
    @Published var showResults: Bool = false
    @Published var selectedAnswer: String? = nil
    @Published var showCorrectAnswer: Bool = false
    @Published var showScorePopup: Bool = false // New state for the pop-up
    
    private var totalQuestions: Int
    
    init(totalQuestions: Int) {
        self.totalQuestions = totalQuestions
        loadQuestions()
    }
    
    func loadQuestions() {
        questions = [
            Question(imageName: "Bell", correctAnswer: "جرس", options: ["جرس", "حقيبة", "كتاب", "قلم"]),
            Question(imageName: "Notebook", correctAnswer: "دفتر", options: ["حقيبة", "دفتر", "قلم", "تاريخ"]),
            Question(imageName: "Pen", correctAnswer: "قلم", options: ["كتاب", "قلم", "سبورة", "حقيبة"]),
            
        ]
        questions = Array(questions.prefix(totalQuestions))
    }
    
    func answerQuestion(answer: String) {
        selectedAnswer = answer
        showCorrectAnswer = true
        
        if answer == currentQuestion.correctAnswer {
            score += 1
        }
        
        // Delay before moving to next question
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.nextQuestion()
        }
    }
    
    func nextQuestion() {
        selectedAnswer = nil
        showCorrectAnswer = false
        
        // Ensure that the index doesn't exceed the total number of questions
        if currentQuestionIndex < totalQuestions - 1 {
            currentQuestionIndex += 1
        } else {
            showResults = true
            showScorePopup = true // Trigger the popup at the end of the quiz
        }
    }
    
    var currentQuestion: Question {
        // Check to ensure currentQuestionIndex doesn't go out of range
        if currentQuestionIndex < questions.count {
            return questions[currentQuestionIndex]
        } else {
            return questions[0] // Safeguard, though this shouldn't happen
        }
    }
    
    var progress: Double {
        return Double(currentQuestionIndex + 1) / Double(totalQuestions)
    }
    
    var scorePercentage: Int {
        return Int((Double(score) / Double(totalQuestions)) * 100)
    }
}

struct Questions: View {
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack {
            if viewModel.showResults {
                VStack {
                    Text("Quiz Complete!")
                        .font(.largeTitle)
                    Text("Your Score: \(viewModel.scorePercentage)%")
                        .font(.title)
                }
            } else {
                VStack {
                    Image(viewModel.currentQuestion.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    
                    Text("سؤال \(viewModel.currentQuestionIndex + 1)/\(viewModel.questions.count)")
                        .font(.headline)
                        .padding()
                    
                    ForEach(viewModel.currentQuestion.options, id: \.self) { option in
                        Button(action: {
                            viewModel.answerQuestion(answer: option)
                        }) {
                            Text(option)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(buttonBackground(option))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                        .disabled(viewModel.selectedAnswer != nil)
                    }
                }
                .padding()
            }
        }
        // Show popup when the quiz is complete
        .sheet(isPresented: $viewModel.showScorePopup) {
            ResultPopup(viewModel: viewModel)
        }
    }
    
    // Change button color based on the selected and correct answer
    func buttonBackground(_ option: String) -> Color {
        if viewModel.showCorrectAnswer {
            if option == viewModel.currentQuestion.correctAnswer {
                return .green
            } else if option == viewModel.selectedAnswer {
                return .red
            }
        }
        return .orange2
    }
}

// Popup view to display the score and correct answers
struct ResultPopup: View {
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Results")
                .font(.largeTitle)
                .bold()
            
            Text("You got \(viewModel.score) out of \(viewModel.questions.count) correct!")
                .font(.title2)
            
            Text("Your Score: \(viewModel.scorePercentage)%")
                .font(.title)
                .padding(.bottom, 20)
            
            Button("Close") {
                viewModel.showScorePopup = false 
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    Questions(viewModel: QuizViewModel(totalQuestions: 3))
}
