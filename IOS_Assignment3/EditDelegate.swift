//
//  EditDelegate.swift
//  
//
// Created by user238804 on 4/17/24.
//

import Foundation

protocol EditDelegate : AnyObject {
    func questionEdited(_ question: Question, prevQues: Question)
}
