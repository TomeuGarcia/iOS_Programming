//
//  ButtonCell.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 1/3/24.
//

import Foundation
import UIKit


class ButtonCell : UITableViewCell {
    
    typealias OnClick = () -> ()
    var onClick: OnClick?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.isUserInteractionEnabled = true
        
        let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(self.onTap))
        self.addGestureRecognizer(gestureRecogniser)
    }
    
    @objc func onTap() {
        self.onClick?()
    }
    
}
