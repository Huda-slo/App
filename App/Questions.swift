import SwiftUI

struct Question {
    let imageName: String
    let correctAnswer: String
    let options: [String]
}

struct Questions1: View {
    @State private var questions: [Question] = []
    @State private var currentQuestionIndex: Int = 0
    @State private var score: Int = 0
    @State private var showResults: Bool = false
    @State private var selectedAnswer: String? = nil
    @State private var showCorrectAnswer: Bool = false
    @State private var showScorePopup: Bool = false

    let totalQuestions: Int = 9
    let optionPool = ["طالب", "معلم", "كرسي", "طاولة", "رياضيات", "تاريخ", "جرس", "حقيبة", "كتاب", "قلم"]

    init() {
        _questions = State(initialValue: Array([
            Question(imageName: "Bell", correctAnswer: "جرس", options: generateOptions(correctAnswer: "جرس")),
            Question(imageName: "Notebook", correctAnswer: "دفتر", options: generateOptions(correctAnswer: "دفتر")),
            Question(imageName: "Pen", correctAnswer: "قلم", options: generateOptions(correctAnswer: "قلم")),
            Question(imageName: "History", correctAnswer: "تاريخ", options: generateOptions(correctAnswer: "تاريخ")),
            Question(imageName: "Multiply", correctAnswer: "ضرب", options: generateOptions(correctAnswer: "ضرب")),
            Question(imageName: "Name", correctAnswer: "اسم", options: generateOptions(correctAnswer: "اسم")),
            Question(imageName: "plus", correctAnswer: "جمع", options: generateOptions(correctAnswer: "جمع")),
            Question(imageName: "Backpack", correctAnswer: "حقيبة", options: generateOptions(correctAnswer: "حقيبة")),
            Question(imageName: "Sharpner", correctAnswer: "براية", options: generateOptions(correctAnswer: "براية")),
        ].shuffled().prefix(totalQuestions))) // Converting ArraySlice to Array
    }

    var body: some View {
        VStack {
            if showResults {
                VStack {
                    Text("لقد أنهيت الاختبار!")
                        .font(.largeTitle)
                    Text("درجتك: \(scorePercentage)%")
                        .font(.title)
                }
            } else {
                VStack {
                    Image(questions[currentQuestionIndex].imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    
                    Text("سؤال \(currentQuestionIndex + 1)/\(questions.count)")
                        .font(.headline)
                        .padding()
                    
                    ForEach(questions[currentQuestionIndex].options, id: \.self) { option in
                        Button(action: {
                            answerQuestion(answer: option)
                        }) {
                            Text(option)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(buttonBackground(option))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                        .disabled(selectedAnswer != nil)
                    }
                }
                .padding()
            }
        }
        .sheet(isPresented: $showScorePopup) {
            ResultPopup(score: score, totalQuestions: questions.count) {
                showScorePopup = false
            }
        }
    }

    func answerQuestion(answer: String) {
        selectedAnswer = answer
        showCorrectAnswer = true

        if answer == questions[currentQuestionIndex].correctAnswer {
            score += 1
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            nextQuestion()
        }
    }

    func nextQuestion() {
        selectedAnswer = nil
        showCorrectAnswer = false

        if currentQuestionIndex < totalQuestions - 1 {
            currentQuestionIndex += 1
        } else {
            showResults = true
            showScorePopup = true
        }
    }

    func buttonBackground(_ option: String) -> Color {
        if showCorrectAnswer {
            if option == questions[currentQuestionIndex].correctAnswer {
                return .green
            } else if option == selectedAnswer {
                return .red
            }
        }
        return .orange2
    }

    var scorePercentage: Int {
        return Int((Double(score) / Double(totalQuestions)) * 100)
    }

    func generateOptions(correctAnswer: String) -> [String] {
        let filteredPool = optionPool.filter { $0 != correctAnswer }
        let randomOptions = filteredPool.shuffled().prefix(3)
        return ([correctAnswer] + randomOptions).shuffled()
    }
}

// Result Popup with congratulatory message and image
struct ResultPopup: View {
    let score: Int
    let totalQuestions: Int
    let closeAction: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("تهانينا!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.orange2)

            // Show a congratulatory image (replace with your desired image)
            Image(systemName: "star.circle.fill")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(.yellow)
                .padding()

            Text("لقد حصلت على \(score) من أصل \(totalQuestions) إجابات صحيحة!")
                .font(.title2)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)

            Text("نسبة النجاح: \(Int((Double(score) / Double(totalQuestions)) * 100))%")
                .font(.title)
                .padding(.bottom, 20)
                .foregroundColor(.orange2)

            Button("إغلاق") {
                closeAction()
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
    Questions1()
}
