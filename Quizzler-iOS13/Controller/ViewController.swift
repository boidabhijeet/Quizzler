//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeQuestion()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if quizBrain.checkAnswer(currentTitle: sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            progressBar.progress = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeQuestion), userInfo: nil, repeats: false)
        
    }
    
    @objc func changeQuestion() {
        questionLabel.text = quiz[questionNumber].question
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        progressBar.progress = Float(questionNumber + 1)/Float(quiz.count)
    }
}

