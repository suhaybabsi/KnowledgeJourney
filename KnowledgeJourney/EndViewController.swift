//
//  EndViewController.swift
//  KnowledgeJourney
//
//  Created by Suhayb Al-Absi on 8/20/18.
//  Copyright © 2018 Suhayb Al-Absi. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func startAgain(_ sender: AnyObject) {
        
        (self.navigationController as? NavigationController)?.startAgain()
    }
}
