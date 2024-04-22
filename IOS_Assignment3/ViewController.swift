//
//  ViewController.swift
//
//
// Created by user238804 on 4/17/24.
//

import UIKit

class ViewController: UIViewController, AddDelegate, QuestionDelegate, EditDelegate {

    var questionArray: [Question] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    func questionAdded(_ question: Question)
    {
        questionArray.append(question)
        print(questionArray)
    }
    
    func questionEdited(_ question: Question, prevQues: Question) {
        if let index = questionArray.firstIndex(of: prevQues){
            questionArray[index] = question
        }
    }
    
    func fetchQuestions() -> [Question] {
        return questionArray
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.destination.title ?? "Issue")
        if let destinationVC = segue.destination as? QuizBankVC {
            destinationVC.questionBankdelegate = self
            destinationVC.delegate = self
            destinationVC.quizBankEditDelegate = self
        }
        if let destinationVC = segue.destination as? QuizVC {
            destinationVC.delegate = self
        }
    }
}

