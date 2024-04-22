//
//  AddQuestionVC.swift
//
//
// Created by user238804 on 4/17/24.
//

import UIKit

class AddQuestionVC: UIViewController {

    weak var delegate: AddDelegate?
    
    func addquestion(_ question: Question) {
        if let delegate {
            delegate.questionAdded(question)
        } else {
            print("Delegate not assigned")
        }
    }
    
    
    @IBAction func cancelClicked(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var questionTextField: UITextField!
    
    
    @IBOutlet weak var correctAnswerTextField: UITextField!
    

    @IBOutlet weak var incorrectAnswer1TextField: UITextField!
    
    @IBOutlet weak var incorrectAnswer2TextField: UITextField!
    
    @IBOutlet weak var incorrectAnswer3TextField: UITextField!
    
    
    @IBAction func saveTheQuestion(_ sender: UIBarButtonItem) {
        if let questiontext = questionTextField.text, let correctAnswer = correctAnswerTextField.text, let incorrectAnswer1TextField = incorrectAnswer1TextField.text, let incorrectAnswer2TextField = incorrectAnswer2TextField.text, let incorrectAnswer3TextField = incorrectAnswer3TextField.text {
            let question = Question(questionText: questiontext, correctAnswer: correctAnswer, allAnswers: [correctAnswer, incorrectAnswer1TextField, incorrectAnswer2TextField, incorrectAnswer3TextField])
            
            addquestion(question)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
