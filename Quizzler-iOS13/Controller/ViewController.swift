//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
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
        
        quizBrain.updateQuestion()
       
        if quizBrain.getProgressBarCount() == 0 {
            scoreLabel.text = "Score: 0"
            progressBar.progress = 0
        } else {
            progressBar.progress = quizBrain.getProgressBarCount()
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeQuestion), userInfo: nil, repeats: false)
        
    }
    
    @objc func changeQuestion() {
        questionLabel.text =  quizBrain.getQuestion()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        progressBar.progress = quizBrain.getProgressBarCount()
    }
}
