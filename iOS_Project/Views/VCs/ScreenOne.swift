//
//  ScreenOne.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 3/5/24.
//

import Foundation
import UIKit

class ScreenOne : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Screen 1"
        
        self.view.backgroundColor = .orange.withAlphaComponent(0.3)
        
        self.toolbarItems = [
            UIBarButtonItem(image: .testSVG, style: .done, target: self, action: nil),
            UIBarButtonItem(systemItem: .flexibleSpace),
            UIBarButtonItem(systemItem: .trash)
        ]
    }
    
}
