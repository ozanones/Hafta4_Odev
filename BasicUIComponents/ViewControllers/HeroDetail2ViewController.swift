//
//  HeroDetail2ViewController.swift
//  BasicUIComponents
//
//  Created by Ozan Deniz Ones on 23.09.2021.
//

import UIKit

class HeroDetail2ViewController: UIViewController {

    let raichuImage = UIImage(named: "raichu.jpg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "raichu.jpg")!)
        
        let background = UIImage(named: "raichu.jpg")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)

    }

}
