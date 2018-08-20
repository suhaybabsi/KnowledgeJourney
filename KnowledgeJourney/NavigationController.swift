//
//  NavigationController.swift
//  KnowledgeJourney
//
//  Created by Suhayb Al-Absi on 8/20/18.
//  Copyright © 2018 Suhayb Al-Absi. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func showQuestion() -> Void {
        
        var views = Array( self.viewControllers.prefix(1) )
        
        if let question = Questions.fetchQuestion(),
            let questionVC = self.storyboard?.instantiateViewController(withIdentifier: "questionVC") as? QuestionViewController {
            
            questionVC.question = question
            views.append(questionVC)
            
        } else if let endVC = self.storyboard?.instantiateViewController(withIdentifier: "endVC") {
            
            views.append(endVC)
        }
        
        self.setViewControllers(views, animated: true)
    }
    
    func startAgain() -> Void {
        
        Questions.current = -1
        showQuestion()
    }
}


class Questions {
    
    static let list = [
        Question(index: 1, text: "ما هي عاصمة الأردن", answers: ["السلط", "اربد", "عمان", "العقبة"], correct: 2),
        Question(index: 2, text: "ما هي عاصمة عُمان", answers: ["صلالة", "مسقط", "السيب", "الحاجر"], correct: 1),
        Question(index: 3, text: "ما هي عاصمة فرنسا", answers: ["ليون", "مرسيليا", "تولوز", "باريس"], correct: 3),
        Question(index: 4, text: "ما هي عاصمة فنلندا", answers: ["هلسنكي", "توركو", "تامبري", "بوري"], correct: 0),
        Question(index: 5, text: "ما هي عاصمة الجزائر", answers: ["قسنطينة", "وهران", "الجزائر", "سطيف"], correct: 2),
        Question(index: 6, text: "ما هي عاصمة كولومبيا", answers: ["كالي", "بوغوتا", "ميدلين", "بارانكويلا"], correct: 1),
        Question(index: 7, text: "ما هي عاصمة اليابان", answers: ["طوكيو", "كيوتو", "اوساكا", "هيروشما"], correct: 0),
    ]
    
    fileprivate static var current:Int = -1
    
    static func fetchQuestion() -> Question? {
        
        let next = current + 1
        
        if next < list.count {
            current = next
            return list[current]
        }
        
        return nil
    }
}


struct Question {
    var index:Int
    var text:String
    var answers:[String]
    var correct:Int
}
