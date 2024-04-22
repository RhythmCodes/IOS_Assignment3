//
//  QuizVC.swift
//
//
// Created by user238804 on 4/17/24.
//

import UIKit

class QuizVC: UIViewController {

    weak var delegate : QuestionDelegate?
   
    lazy var questions: [Question] = delegate?.fetchQuestions() ?? []
    var currentQuestionIndex = 0
    
    var savedAnswers : [String: String] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpQuestionLabels()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answerOptions: [UIButton]!
    
    
    @IBAction func selectAnAnswer(_ sender: Any) {
        if let button = sender as? UIButton, let buttonIndex = answerOptions.firstIndex(of: button) {
            savedAnswers[questions[currentQuestionIndex].questionText] = questions[currentQuestionIndex].allAnswers[buttonIndex]
            answerOptions.forEach { $0.setImage(UIImage(systemName: "circle"), for: .normal) }
            button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            
        }
    }
    
    @IBAction func goToPreviousQuestion(_ sender: UIButton) {
        if currentQuestionIndex > 0 {
            currentQuestionIndex -= 1
        }
        setUpQuestionLabels()
    }
    
    @IBAction func goToNextQuestion(_ sender: UIButton) {
        if currentQuestionIndex < questions.count {
            currentQuestionIndex += 1
        }
        setUpQuestionLabels()
    }
    
    func setUpQuestionLabels() {
        if questions.indices.contains(currentQuestionIndex) {
            let currentQuestion = questions[currentQuestionIndex]
            questionLabel.text = currentQuestion.questionText
            answerOptions.forEach {
                $0.setImage(UIImage(systemName: "circle"), for: .normal)
            }
            for labelIndex in 0..<answerOptions.count {
                answerOptions[labelIndex].setTitle(currentQuestion.allAnswers[labelIndex], for: .normal)
                if currentQuestion.allAnswers[labelIndex] == savedAnswers[currentQuestion.questionText] {
                    answerOptions[labelIndex].setImage(UIImage(systemName: "circle.fill"), for: .normal)
                }
            }
            progressOfTheGame.progress = Float(currentQuestionIndex + 1) / Float(questions.count)
        }
        
    }
    
    @IBOutlet weak var progressOfTheGame: UIProgressView!
    
   


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("preparing")
        var result : Float = 0.0
        for question in questions {
            if savedAnswers[question.questionText] == question.correctAnswer {
                result += 1
            }
            
        }
        if let destinationVC = segue.destination as? ResultsViewController {
            if questions.count != 0 {
                destinationVC.result = result / Float(questions.count)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
