//
//  ScreenTwo.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 3/5/24.
//

import Foundation
import UIKit

class ScreenTwo : UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Screen 2"
        
        self.view.backgroundColor = .cyan.withAlphaComponent(0.3)
        
        self.toolbarItems = [
            UIBarButtonItem(systemItem: .trash),
            UIBarButtonItem(systemItem: .flexibleSpace),
            UIBarButtonItem(systemItem: .action)
        ]
    }
    
    
    
}

