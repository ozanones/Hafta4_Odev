//
//  HeroAnimationViewController.swift
//  BasicUIComponents
//
//  Created by Ozan Deniz Ones on 23.09.2021.
//

import UIKit
import Hero

class HeroDetailViewController: UIViewController {

    @IBOutlet weak var transitionButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //This button makes the transition effect by changing viewcontroller
    @IBAction func transitionButtonTapped(_ sender: Any) {
        
        let nextViewController = HeroDetail2ViewController()
        nextViewController.hero.isEnabled = true
        nextViewController.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .fade)

        present(nextViewController, animated: true, completion: nil)
    }
}
