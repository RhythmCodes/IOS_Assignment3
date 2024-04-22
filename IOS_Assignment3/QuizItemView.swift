//
//  QuizItemView.swift
//
//
//  Created by user238804 on 4/17/24.
//

import UIKit

class QuizItemView: UITableViewCell {

    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var correctAnswer: UILabel!
    
    @IBOutlet var wrongAnswers: [UILabel]!

}
