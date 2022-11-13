//
//  StartViewController.swift
//  GameApp
//
//  Created by Max Franz Immelmann on 11/12/22.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

       
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mainVC = segue.destination as? MainViewController else { return }
        mainVC.players = Player.getPlayersList()
    }
    
    
    

    

}
