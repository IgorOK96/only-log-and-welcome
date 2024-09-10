//
//  WelcomeViewController.swift
//  only log and welcome
//
//  Created by user246073 on 9/9/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome \(userName ?? "")!"
        applyGradient(to: self.view, colors: [UIColor.red, UIColor.blue])
    }
}

    extension WelcomeViewController {
        
        func applyGradient(to view: UIView, colors: [UIColor], locations: [NSNumber]? = nil, startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0), endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0)) {
            let gradientLayer = CAGradientLayer()
            
            gradientLayer.colors = colors.map { $0.cgColor }
            
            gradientLayer.locations = locations
            
            gradientLayer.startPoint = startPoint
            gradientLayer.endPoint = endPoint
            
            gradientLayer.frame = view.bounds
            
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
    }

