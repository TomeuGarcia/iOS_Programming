//
//  StartVC.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 22/3/24.
//

import Foundation
import UIKit


class StartVC : NavVC {
      
    
    lazy var utilButton: Button = {
        let button = Button(Label("Click me !!!"))
        
        self.view.addSubview(button)
        button.alignVerticalTo(self.view)
            .alignHorizontalTo(self.view)
        
        button.backgroundColor = .black
        
        return button
    }()

    lazy var toRootButton: Button = {
        let button = Button(Label("To Root"))
        
        self.view.addSubview(button)
        button
            .alignHorizontalTo(self.view)
            .underTo(self.utilButton)
        
        button.backgroundColor = .black
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray

        let screen = ScreenOne()
        self.pushViewController(screen, animated: true)
        
        self.utilButton.onClick = {
            
            let screen = ScreenTwo()
            self.pushViewController(screen, animated: true)
            
        }
        
        self.toRootButton.onClick = {
            self.popToRootViewController(animated: true)
        }
        
        self.navigationBar.backgroundColor = .magenta
        
        self.toolbar.backgroundColor = .green
        self.setToolbarHidden(false, animated: false)
        

    }
    
    
    
    func testAlerts() {
        
        self.utilButton.onClick = {
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
                    self.utilButton.label?.text = tempTextField?.text
                }
            
            let cancelButton = UIAlertAction(
                title: "Cancel",
                style: .cancel)

            let destroyButton = UIAlertAction(
                title: "Destroy",
                style: .destructive) { action in
                self.utilButton.label?.text = "Destroyed"
                self.utilButton.label?.textColor = .red
            }
            

            
            alert.addAction(okButton)
            alert.addAction(cancelButton)
            alert.addAction(destroyButton)
            
            self.present(alert, animated: true)
        }
        
    }
    
}
