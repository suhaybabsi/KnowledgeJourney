//
//  StartViewController.swift
//  KnowledgeJourney
//
//  Created by Suhayb Al-Absi on 8/20/18.
//  Copyright © 2018 Suhayb Al-Absi. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startGame(_ sender:Any ) {
        
        if let name = self.nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines), name.isEmpty == false {
            
            (self.navigationController as? NavigationController)?.showQuestion()
        
        } else {
        
            showMessage("الرجاء كتابة اسمك بشكل جيد")
        }
    }

}
