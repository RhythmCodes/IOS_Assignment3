//
//  QuestionDelegate.swift
//
//
//  Created by user238804 on 4/17/24.
//

import Foundation

protocol QuestionDelegate : AnyObject {
    func fetchQuestions() -> [Question]
}
