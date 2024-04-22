//
//  QuizBankVC.swift
//
//
//  Created by user238804 on 4/17/24.
//

import UIKit

class QuizBankVC: UIViewController, AddDelegate, UITableViewDataSource, UITableViewDelegate , EditDelegate {
   
    
    func questionAdded(_ question: Question) {
        questionBankdelegate?.questionAdded(question)
        tableView.reloadData()
    }
    
    func questionEdited(_ question: Question, prevQues: Question) {
        quizBankEditDelegate?.questionEdited(question, prevQues: prevQues)
        tableView.reloadData()
    }
    

    weak var quizBankEditDelegate: EditDelegate?
    
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: QuestionDelegate?
    
    var questions: [Question] { delegate?.fetchQuestions() ?? [] }
    
    
    func fetchQuestions() -> [Question] {
        return delegate?.fetchQuestions() ?? []
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomQuizViewCell", for: indexPath) as! QuizItemView
        
        let question = questions[indexPath.row]
        cell.question.text = question.questionText
        
        cell.correctAnswer.text = question.correctAnswer
        let incorrectAnswers = question.allAnswers.filter { $0 != question.correctAnswer }
        for index in cell.wrongAnswers.indices {
            cell.wrongAnswers[index].text = incorrectAnswers[index]
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    weak var questionBankdelegate: AddDelegate?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                // Get the selected item from the data source
                let selectedQuestion = questions[indexPath.row]
                
                if let editVC = segue.destination as? EditQuestionVC {
                    // Pass the selected question to the popover view controller
                    editVC.selectedQuestion = selectedQuestion
                    editVC.delegate = self
                }
            }
        }
        
        if let destinationVC = segue.destination as? AddQuestionVC {
            destinationVC.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
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
