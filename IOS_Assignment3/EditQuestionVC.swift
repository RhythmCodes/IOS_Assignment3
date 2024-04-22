//
//  EditQuestionVC.swift
//
//
//  Created by user238804 on 4/17/24.
//

import UIKit

class EditQuestionVC: UIViewController {

    
    weak var delegate : EditDelegate?
    var selectedQuestion : Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTheView()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var correctAnswerTextField: UITextField!
    
    
    @IBOutlet weak var incorrectAnswer1TextFieldField: UITextField!
    
    
    @IBOutlet weak var incorrectAnswer2TextFieldField: UITextField!
    
    @IBOutlet weak var incorrectAnswer3TextFieldField: UITextField!
    
    
    @IBAction func cancelTheEdit(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveTheEdit(_ sender: UIBarButtonItem) {
        if let questiontext = questionTextField.text, let correctAnswer = correctAnswerTextField.text, let incorrectAnswer1TextField = incorrectAnswer1TextFieldField.text, let incorrectAnswer2TextField = incorrectAnswer2TextFieldField.text, let incorrectAnswer3TextField = incorrectAnswer3TextFieldField.text {
            let question = Question(questionText: questiontext, correctAnswer: correctAnswer, allAnswers: [correctAnswer, incorrectAnswer1TextField, incorrectAnswer2TextField, incorrectAnswer3TextField])
            
            editTheQuestion(question)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func loadTheView() {
        
        if let question = selectedQuestion {
            print(question)
            questionTextField.text = question.questionText
            correctAnswerTextField.text = question.correctAnswer
            
            
            let incorrectAnswers = question.allAnswers.filter { $0 != question.correctAnswer }
            
            incorrectAnswer1TextFieldField.text = incorrectAnswers[0]
            incorrectAnswer2TextFieldField.text = incorrectAnswers[1]
            incorrectAnswer3TextFieldField.text = incorrectAnswers[2]
        }
        
        
    }
    
    func editTheQuestion(_ question: Question) {
        if let delegate, let selectedQuestion {
            delegate.questionEdited(question, prevQues: selectedQuestion)
        } else {
            print("Delegate not assigned")
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
