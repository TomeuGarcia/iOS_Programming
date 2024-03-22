//
//  StartVC.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 22/3/24.
//

import Foundation
import UIKit

class StartVC : VC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .gray
        
        let codeView = UIView()
        self.view.addSubview(codeView)
        
        codeView.backgroundColor = .blue
        
        
        /*
        codeView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = codeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        centerX.isActive = true
        
        codeView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100)
            .isActive = true
        
        NSLayoutConstraint.activate([
            codeView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            NSLayoutConstraint(
                item: codeView,
                attribute: .height,
                relatedBy: .equal,
                toItem: self.view,
                attribute: .height,
                multiplier: 1,
                constant: -300
            )
        ])
         */
        
        /*
        codeView.enableConstraints()
            .centerX(to: self.view)
            .centerY(to: self.view, constant: 100)
            .equalWidth(to: self.view, multiplier: 0.5)
            .equalHeight(to: self.view, multiplier: -300)
        */
    }
}
