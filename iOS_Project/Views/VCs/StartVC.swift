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
        
        codeView.backgroundColor = .red
        
        codeView.activateConstraints()
            .alignVerticalTo(self.view)
            .alignHorizontalTo(self.view)
            .heightTo(constant: 100)
            .widthTo(constant: 100)
        
        
        let v2 = UIView()
        v2.backgroundColor = .purple
        
        codeView.addSubview(v2)
        
        v2.activateConstraints()
            .equalHeightTo(codeView, multiplier: 0.5)
            .equalWidthTo(codeView, multiplier: 0.5)
            .alignVerticalTo(codeView)
            .alignHorizontalTo(codeView)
        
        
        let v3 = UIView()
        v3.backgroundColor = .yellow
        
        self.view.addSubview(v3)
        
        v3.activateConstraints()
            .equalHeightTo(codeView, multiplier: 1.5)
            .equalWidthTo(codeView, multiplier: 1.5)
            .alignHorizontalTo(codeView)
            .aboveTo(codeView, margin: 50)
        
        
        let v4 = UIView()
        v4.backgroundColor = UIColor(named: "Primary")
        v4.backgroundColor = .primary
        
        self.view.addSubview(v4)
        
        v4.activateConstraints()
            .equalHeightTo(codeView, multiplier: 1.5)
            .equalWidthTo(codeView, multiplier: 1.5)
            .alignHorizontalTo(codeView)
            .underTo(codeView, margin: .spaceHuge)
        
        
        let label = Label("Welcome_Key".Translated, style: .body)
        v3.addSubview(label)
        
        label.pinTo(v3, padding: .spaceHalf)
        
        
        let appleImageView = UIImageView()
        appleImageView.image = UIImage(named: "TestSVG")
        //appleImageView.image = #imageLiteral(resourceName: "TestSVG")
        
        v4.addSubview(appleImageView)
        appleImageView.activateConstraints()
            .pinTo(v4)

    }
}
