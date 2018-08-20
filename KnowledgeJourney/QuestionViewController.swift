//
//  ViewController.swift
//  KnowledgeJourney
//
//  Created by Suhayb Al-Absi on 9/2/16.
//  Copyright © 2016 Suhayb Al-Absi. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel:UILabel!
    @IBOutlet weak var titleLabel:UILabel!
    var question:Question!
    var questionIndex:Int = 0
    
    @IBOutlet weak var stackView: UIStackView!
    
    let successColor = UIColor(red: 78/255.0, green: 223/255.0, blue: 156/255.0, alpha: 1)
    let failColor = UIColor(red: 255/255.0, green: 62/255.0, blue: 28/255.0, alpha: 1)
    
    var buttons = [UIButton]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = "السؤال رقم (\(self.question.index))"
        self.questionLabel.text = self.question.text
        
        for i in 0 ..< self.question.answers.count {
            
            let answer = self.question.answers[i]
            let button = createAnswerButton(answer)
            button.tag = i
            
            button.addTarget(self, action: #selector( answerButtonTapped(_:) ), for: .touchUpInside)
            button.addConstraint(NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45) )
            
            self.buttons.append(button)
            self.stackView.addArrangedSubview(button)
        }
    }
    
    var selectedIndex:Int = -1
    func answerButtonTapped(_ sender:UIButton ) -> Void {
        
        self.selectedIndex = sender.tag
        self.buttons.forEach { (btn) in
            btn.setImage(btn == sender ? #imageLiteral(resourceName: "ic_radio_button_checked") : #imageLiteral(resourceName: "ic_radio_button_unchecked"), for: .normal)
        }
        
        print("Answer selected: \(sender.tag)")
    }
    
    @IBOutlet weak var submitIcon: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func submitAnswer(_ sender: AnyObject) {
        
        if submitButton.tag == 0 {
        
            guard self.selectedIndex >= 0 else {
                showMessage("من فضلك !. اختر إجابة أولاً")
                return
            }
            
            let currentBtn = self.buttons[self.selectedIndex]
            
            if self.selectedIndex == self.question.correct {
                
                currentBtn.setImage(#imageLiteral(resourceName: "ic_check_circle"), for: .normal)
                currentBtn.backgroundColor = successColor
                
            } else {
                
                currentBtn.setImage(#imageLiteral(resourceName: "ic_cancel"), for: .normal)
                currentBtn.backgroundColor = failColor
            
                let correctBtn = self.buttons[self.question.correct]
                correctBtn.setImage(#imageLiteral(resourceName: "ic_check_circle"), for: .normal)
                correctBtn.backgroundColor = successColor
            }
            
            submitButton.tag = 1
            submitButton.setTitle("السؤال التالي", for: .normal)
            submitIcon.image = #imageLiteral(resourceName: "baseline_keyboard_arrow_left_black_36pt")
            submitButton.backgroundColor = UIColor.magenta
            
        } else {
        
            (self.navigationController as? NavigationController)?.showQuestion()
        }
    }
    
}

func createAnswerButton(_ title:String ) -> UIButton {
    
    let button = UIButton(type: .system)
    button.semanticContentAttribute = .forceRightToLeft
    
    button.contentHorizontalAlignment = .right
    button.contentVerticalAlignment = .center
    button.tintColor = UIColor.black
    
    button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
    button.setTitle(title, for: .normal)
    button.backgroundColor = UIColor(white: 0.95, alpha: 1)
    
    button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 3, right: 9)
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    button.setImage(#imageLiteral(resourceName: "ic_radio_button_unchecked"), for: .normal)
    
    return button
}
