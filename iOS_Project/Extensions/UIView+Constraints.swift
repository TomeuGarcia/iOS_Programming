//
//  UIView+Constraints.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 22/3/24.
//

import Foundation
import UIKit

extension UIView {
    
    public enum ConstraintType {
        case Lesser
        case Equal
        case Greater
    }
    
    @discardableResult
    func activateConstraints() -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    
    
    // MARK: Aligns
    
    @discardableResult
    func alignLeftConstraint(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherLeadingAnchor = safeArea ?
            other.safeAreaLayoutGuide.leadingAnchor :
            other.leadingAnchor
        
        switch(type) {
        case .Lesser:
            constraint = self.leadingAnchor.constraint(lessThanOrEqualTo: otherLeadingAnchor, 
                                                       constant: padding)
        case .Equal:
            constraint = self.leadingAnchor.constraint(equalTo: otherLeadingAnchor, 
                                                       constant: padding)
        case .Greater:
            constraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: otherLeadingAnchor, 
                                                       constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult
    func alignLeftTo(
        _ other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alignLeftConstraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }
    
    
    
    @discardableResult
    func alignRightConstraint(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherTrailingAnchor = safeArea ?
            other.safeAreaLayoutGuide.trailingAnchor :
            other.trailingAnchor
                
        switch(type) {
        case .Lesser:
            constraint = self.trailingAnchor.constraint(lessThanOrEqualTo: otherTrailingAnchor,
                                                       constant: -padding)
        case .Equal:
            constraint = self.trailingAnchor.constraint(equalTo: otherTrailingAnchor,
                                                       constant: -padding)
        case .Greater:
            constraint = self.trailingAnchor.constraint(greaterThanOrEqualTo: otherTrailingAnchor,
                                                       constant: -padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult
    func alignRightTo(
        _ other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alignRightConstraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }
        
    
    
    @discardableResult
    func alignBottomConstraint(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherBottomAnchor = safeArea ?
            other.safeAreaLayoutGuide.bottomAnchor :
            other.bottomAnchor
                
        switch(type) {
        case .Lesser:
            constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: otherBottomAnchor,
                                                       constant: padding)
        case .Equal:
            constraint = self.bottomAnchor.constraint(equalTo: otherBottomAnchor,
                                                       constant: padding)
        case .Greater:
            constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: otherBottomAnchor,
                                                       constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult
    func alignBottomTo(
        _ other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alignBottomConstraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }
    
    
    
    @discardableResult
    func alignTopConstraint(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherTopAnchor = safeArea ?
            other.safeAreaLayoutGuide.topAnchor :
            other.topAnchor
                
        switch(type) {
        case .Lesser:
            constraint = self.topAnchor.constraint(lessThanOrEqualTo: otherTopAnchor,
                                                       constant: -padding)
        case .Equal:
            constraint = self.topAnchor.constraint(equalTo: otherTopAnchor,
                                                       constant: -padding)
        case .Greater:
            constraint = self.topAnchor.constraint(greaterThanOrEqualTo: otherTopAnchor,
                                                       constant: -padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult
    func alignTopTo(
        _ other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alignTopConstraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }
        
    
    
    
    
    // MARK: Center Aligns
    // TODO X
    // TODO Y
    
    
    
    // MARK: Relatives
    // Below of
    @discardableResult
    func alignBelowConstraint(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherBottomAnchor = safeArea ?
            other.safeAreaLayoutGuide.bottomAnchor :
            other.bottomAnchor
        
        switch(type) {
        case .Lesser:
            constraint = self.topAnchor.constraint(lessThanOrEqualTo: otherBottomAnchor,
                                                       constant: padding)
        case .Equal:
            constraint = self.topAnchor.constraint(equalTo: otherBottomAnchor,
                                                       constant: padding)
        case .Greater:
            constraint = self.topAnchor.constraint(greaterThanOrEqualTo: otherBottomAnchor,
                                                       constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult
    func belowOf(
        _ other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alignBelowConstraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }
    
    
    // On top of
    @discardableResult
    func alignOnTopConstraint(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherTopAnchor = safeArea ?
            other.safeAreaLayoutGuide.topAnchor :
            other.topAnchor
        
        switch(type) {
        case .Lesser:
            constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: otherTopAnchor,
                                                       constant: padding)
        case .Equal:
            constraint = self.bottomAnchor.constraint(equalTo: otherTopAnchor,
                                                       constant: padding)
        case .Greater:
            constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: otherTopAnchor,
                                                       constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult
    func onTopOf(
        _ other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alignOnTopConstraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }
    
    // TODO Left to
    // TODO Right to
    
    
    
    
    // MARK: Helpers
    
    @discardableResult
    func pinTo(_ other: UIView,
               padding: CGFloat = 0,
               safeArea: Bool = true
    ) -> UIView {
        
        self.activateConstraints()
            .alignLeftTo   (other, padding: padding, safeArea: safeArea)
            .alignRightTo  (other, padding: padding, safeArea: safeArea)
            .alignBottomTo (other, padding: padding, safeArea: safeArea)
            .alignTopTo    (other, padding: padding, safeArea: safeArea)
        return self
    }
     
    
    

    
    
    
}
