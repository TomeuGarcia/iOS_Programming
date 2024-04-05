//
//  Button.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 5/4/24.
//

import Foundation
import UIKit

class Button : UIView {
    
    typealias OnClickCallback = () -> ()
    
    var label: Label?
    var onClick: OnClickCallback = {}
    

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(_ label: Label? = nil, onClick: @escaping OnClickCallback = {}) {
        super.init(frame: .zero)
        
        self.activateConstraints()
        if let label = label {
            self.label = label
            self.addSubview(label)
            label.pinTo(self)
        }
        
        self.onClick = onClick
        self.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.OnTap))
        self.addGestureRecognizer(gesture)
    }

    
    @objc func OnTap() {
        self.onClick()
    }
    
}
