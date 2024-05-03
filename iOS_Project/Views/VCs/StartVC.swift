//
//  StartVC.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 22/3/24.
//

import Foundation
import UIKit


class StartVC : VC {
      
    
    lazy var countButton: Button = {
        let button = Button(Label("Click me !!!"))
        
        self.view.addSubview(button)
        button.alignVerticalTo(self.view)
            .alignHorizontalTo(self.view)
        
        button.backgroundColor = .black
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray


    }
    
    
}
