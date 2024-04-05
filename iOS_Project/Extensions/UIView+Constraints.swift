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
        
        let otherLeadingAnchor = safeArea ?
            other.safeAreaLayoutGuide.leadingAnchor :
            other.leadingAnchor
        
        return alignXAxisConstraint(
            padding: padding,
            type: type,
            safeArea: safeArea,
            activated: activated,
            otherAnchor: otherLeadingAnchor,
            thisAnchor: self.leadingAnchor)
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
        
        let otherTrailingAnchor = safeArea ?
            other.safeAreaLayoutGuide.trailingAnchor :
            other.trailingAnchor
                
        return alignXAxisConstraint(
            padding: -padding,
            type: type,
            safeArea: safeArea,
            activated: activated,
            otherAnchor: otherTrailingAnchor,
            thisAnchor: self.trailingAnchor)
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
        
        let otherBottomAnchor = safeArea ?
            other.safeAreaLayoutGuide.bottomAnchor :
            other.bottomAnchor
                
        return alignYAxisConstraint(
            padding: padding,
            type: type,
            safeArea: safeArea,
            activated: activated,
            otherAnchor: otherBottomAnchor,
            thisAnchor: self.bottomAnchor)
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
        
        let otherTopAnchor = safeArea ?
            other.safeAreaLayoutGuide.topAnchor :
            other.topAnchor
        
        return alignYAxisConstraint(
            padding: -padding,
            type: type,
            safeArea: safeArea,
            activated: activated,
            otherAnchor: otherTopAnchor,
            thisAnchor: self.topAnchor)
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
    func alignXCenterConstraint(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) {
        
        alignTopConstraint(
            other: other,
            padding: padding,
            type: type,
            safeArea: safeArea,
            activated: activated)
        
        alignBottomConstraint(
            other: other,
            padding: padding,
            type: type,
            safeArea: safeArea,
            activated: activated)
    }
    
    // TODO Y
    func alignYCenterConstraint(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) {
        
        alignLeftConstraint(
            other: other,
            padding: padding,
            type: type,
            safeArea: safeArea,
            activated: activated)
        
        alignRightConstraint(
            other: other,
            padding: padding,
            type: type,
            safeArea: safeArea,
            activated: activated)
    }
    
    
    
    // MARK: Relatives
    // Below of [DONE]
    @discardableResult
    func alignBelowConstraint(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let otherBottomAnchor = safeArea ?
            other.safeAreaLayoutGuide.bottomAnchor :
            other.bottomAnchor
        
        return alignYAxisConstraint(
            padding: -padding,
            type: type,
            safeArea: safeArea,
            activated: activated,
            otherAnchor: otherBottomAnchor,
            thisAnchor: self.topAnchor)
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
    
    
    // On top of [DONE]
    @discardableResult
    func alignOnTopConstraint(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let otherTopAnchor = safeArea ?
            other.safeAreaLayoutGuide.topAnchor :
            other.topAnchor
        
        return alignYAxisConstraint(
            padding: padding,
            type: type,
            safeArea: safeArea,
            activated: activated,
            otherAnchor: otherTopAnchor,
            thisAnchor: self.bottomAnchor)
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
    
    
    
    // TODO Left of [DONE]
    @discardableResult
    func alignLeftOfConstraint(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let otherLeadingAnchor = safeArea ?
            other.safeAreaLayoutGuide.leadingAnchor :
            other.leadingAnchor
        
        return alignXAxisConstraint(
            padding: padding,
            type: type,
            safeArea: safeArea,
            activated: activated,
            otherAnchor: otherLeadingAnchor,
            thisAnchor: self.trailingAnchor)
    }
    
    @discardableResult
    func onLeftOf(
        _ other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alignLeftOfConstraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }

    
    
    // TODO Right to [DONE]
    @discardableResult
    func alignRightOfConstraint(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let otherTrailingAnchor = safeArea ?
            other.safeAreaLayoutGuide.trailingAnchor :
            other.trailingAnchor
        
        return alignXAxisConstraint(
            padding: padding,
            type: type,
            safeArea: safeArea,
            activated: activated,
            otherAnchor: otherTrailingAnchor,
            thisAnchor: self.leadingAnchor)
    }
    
    @discardableResult
    func onRightOf(
        _ other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alignRightOfConstraint(other: other, padding: padding, type: type, safeArea: safeArea, activated: true)
        return self
    }
    
    
    
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
     
    
    
    private func alignXAxisConstraint(
        padding: CGFloat,
        type: ConstraintType,
        safeArea: Bool,
        activated: Bool,
        otherAnchor: NSLayoutXAxisAnchor,
        thisAnchor: NSLayoutXAxisAnchor
    ) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
                
        switch(type) {
        case .Lesser:
            constraint = thisAnchor.constraint(lessThanOrEqualTo: otherAnchor, constant: padding)
        case .Equal:
            constraint = thisAnchor.constraint(equalTo: otherAnchor, constant: padding)
        case .Greater:
            constraint = thisAnchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    
    private func alignYAxisConstraint(
        padding: CGFloat,
        type: ConstraintType,
        safeArea: Bool,
        activated: Bool,
        otherAnchor: NSLayoutYAxisAnchor,
        thisAnchor: NSLayoutYAxisAnchor
    ) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
                
        switch(type) {
        case .Lesser:
            constraint = thisAnchor.constraint(lessThanOrEqualTo: otherAnchor, constant: padding)
        case .Equal:
            constraint = thisAnchor.constraint(equalTo: otherAnchor, constant: padding)
        case .Greater:
            constraint = thisAnchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    

    
    
    
}
