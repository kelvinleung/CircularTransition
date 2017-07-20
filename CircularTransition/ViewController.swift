//
//  ViewController.swift
//  CircularTransition
//
//  Created by Kelvin Leung on 20/07/2017.
//  Copyright © 2017 Kelvin Leung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var menuButton: UIButton!
    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton.layer.cornerRadius = menuButton.frame.size.width / 2
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor ?? UIColor.orange
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor ?? UIColor.orange
        
        return transition
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondVC = segue.destination as? SecondViewController {
            secondVC.transitioningDelegate = self
            secondVC.modalPresentationStyle = .custom
        }
    }

}

