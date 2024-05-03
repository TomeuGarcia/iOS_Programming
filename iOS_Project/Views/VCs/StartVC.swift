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


        testAlerts()
    }
    
    func testAlerts() {
        
        self.countButton.onClick = {
            let alert = UIAlertController(
                title: "My first Pop Up",
                message: "Long Long Long Message\n Second Line",
                preferredStyle: .alert)
            
            var tempTextField: UITextField? = nil
            
            alert.addTextField { textField in
                tempTextField = textField
                textField.placeholder = "Placeholder text"
            }
            
            let okButton = UIAlertAction(
                title: "Ok",
                style: .default) { action in
                    self.countButton.label?.text = tempTextField?.text
                }
            
            let cancelButton = UIAlertAction(
                title: "Cancel",
                style: .cancel)

            let destroyButton = UIAlertAction(
                title: "Destroy",
                style: .destructive) { action in
                self.countButton.label?.text = "Destroyed"
                self.countButton.label?.textColor = .red
            }
            

            
            alert.addAction(okButton)
            alert.addAction(cancelButton)
            alert.addAction(destroyButton)
            
            self.present(alert, animated: true)
        }
        
    }
    
}
