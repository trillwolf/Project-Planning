//
//  GameButtonController.swift
//  Project Planning
//
//  Created by GWC on 7/19/19.
//  Copyright © 2019 Shannon Moreno. All rights reserved.
//

import UIKit

class GameButtonController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func showGame (_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Game" , bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "GameInitial")
        
        present(controller, animated: true, completion: nil)
        
    }

}
