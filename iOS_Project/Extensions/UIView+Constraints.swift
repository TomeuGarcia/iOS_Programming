//
//  UIView+Constraints.swift
//  projectclase
//
//  Created by Abraham on 22/3/24.
//

import Foundation
import UIKit

extension UIView {
    
    public enum ConstraintType {
        case Lesser
        case Equal
        case Greater
    }
    
    @discardableResult func activateConstraints() -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    //MARK: Aligns
    
    //MARK: Horiontal Aligns
    
    @discardableResult func alignLeftConstraint(
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
            constraint = self.leadingAnchor.constraint(lessThanOrEqualTo: otherLeadingAnchor, constant: padding)
        case .Equal:
            constraint = self.leadingAnchor.constraint(equalTo: otherLeadingAnchor, constant: padding)
        case .Greater:
            constraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: otherLeadingAnchor, constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func alignLeftTo(
        _ other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alignLeftConstraint(other: other, padding: padding, type: type, safeArea: safeArea)
        
        return self
    }
    
    @discardableResult func alignRightConstraint(
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
            constraint = self.trailingAnchor.constraint(lessThanOrEqualTo: otherTrailingAnchor, constant: -padding)
        case .Equal:
            constraint = self.trailingAnchor.constraint(equalTo: otherTrailingAnchor, constant: -padding)
        case .Greater:
            constraint = self.trailingAnchor.constraint(greaterThanOrEqualTo: otherTrailingAnchor, constant: -padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func alignRightTo(
        _ other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alignRightConstraint(other: other, padding: padding, type: type, safeArea: safeArea)
        
        return self
    }
    
    //MARK: Vertical Aligns
    
    @discardableResult func alignTopConstraint(
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
            constraint = self.topAnchor.constraint(lessThanOrEqualTo: otherTopAnchor, constant: padding)
        case .Equal:
            constraint = self.topAnchor.constraint(equalTo: otherTopAnchor, constant: padding)
        case .Greater:
            constraint = self.topAnchor.constraint(greaterThanOrEqualTo: otherTopAnchor, constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func alignTopTo(
        _ other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alignTopConstraint(other: other, padding: padding, type: type, safeArea: safeArea)
        
        return self
    }
    
    @discardableResult func alignBotConstraint(
        other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherBotAnchor = safeArea ?
            other.safeAreaLayoutGuide.bottomAnchor :
            other.bottomAnchor
        
        switch(type) {
        case .Lesser:
            constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: otherBotAnchor, constant: -padding)
        case .Equal:
            constraint = self.bottomAnchor.constraint(equalTo: otherBotAnchor, constant: -padding)
        case .Greater:
            constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: otherBotAnchor, constant: -padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func alignBotTo(
        _ other: UIView,
        padding: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alignBotConstraint(other: other, padding: padding, type: type, safeArea: safeArea)
        
        return self
    }
    
    //MARK: Center Aligns
    
    @discardableResult func alingHorizontalConstraint(
        other: UIView,
        offset: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherCenterX = safeArea ?
            other.safeAreaLayoutGuide.centerXAnchor :
            other.centerXAnchor
        
        switch(type) {
        case .Lesser:
            constraint = self.centerXAnchor.constraint(lessThanOrEqualTo: otherCenterX, constant: offset)
        case .Equal:
            constraint = self.centerXAnchor.constraint(equalTo: otherCenterX, constant: offset)
        case .Greater:
            constraint = self.centerXAnchor.constraint(greaterThanOrEqualTo: otherCenterX, constant: offset)
        }
        
        constraint.isActive = activated
        
        return constraint
        
    }
    
    @discardableResult func alignHorizontalTo(
        _ other: UIView,
        offset: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alingHorizontalConstraint(other: other, offset: offset, type: type, safeArea: safeArea)
        
        return self
    }
    
    @discardableResult func alingVerticalConstraint(
        other: UIView,
        offset: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherCenterY = safeArea ?
            other.safeAreaLayoutGuide.centerYAnchor :
            other.centerYAnchor
        
        switch(type) {
        case .Lesser:
            constraint = self.centerYAnchor.constraint(lessThanOrEqualTo: otherCenterY, constant: offset)
        case .Equal:
            constraint = self.centerYAnchor.constraint(equalTo: otherCenterY, constant: offset)
        case .Greater:
            constraint = self.centerYAnchor.constraint(greaterThanOrEqualTo: otherCenterY, constant: offset)
        }
        
        constraint.isActive = activated
        
        return constraint
        
    }
    
    @discardableResult func alignVerticalTo(
        _ other: UIView,
        offset: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        alingVerticalConstraint(other: other, offset: offset, type: type, safeArea: safeArea)
        
        return self
    }
    
    //MARK: Relatives
    
    //MARK: Horiontal Relatives
    
    @discardableResult func leftConstraint(
        other: UIView,
        margin: CGFloat = 0,
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
            constraint = self.trailingAnchor.constraint(lessThanOrEqualTo: otherLeadingAnchor, constant: -margin)
        case .Equal:
            constraint = self.trailingAnchor.constraint(equalTo: otherLeadingAnchor, constant: -margin)
        case .Greater:
            constraint = self.trailingAnchor.constraint(greaterThanOrEqualTo: otherLeadingAnchor, constant: -margin)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func leftTo(
        _ other: UIView,
        margin: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        leftConstraint(other: other, margin: margin, type: type, safeArea: safeArea)
        
        return self
    }
    
    @discardableResult func rightConstraint(
        other: UIView,
        margin: CGFloat = 0,
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
            constraint = self.leadingAnchor.constraint(lessThanOrEqualTo: otherTrailingAnchor, constant: margin)
        case .Equal:
            constraint = self.leadingAnchor.constraint(equalTo: otherTrailingAnchor, constant: margin)
        case .Greater:
            constraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: otherTrailingAnchor, constant: margin)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func rightTo(
        _ other: UIView,
        margin: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        rightConstraint(other: other, margin: margin, type: type, safeArea: safeArea)
        
        return self
    }
    
    //MARK: Vertical Relatives
    
    @discardableResult func aboveConstraint(
        other: UIView,
        margin: CGFloat = 0,
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
            constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: otherTopAnchor, constant: -margin)
        case .Equal:
            constraint = self.bottomAnchor.constraint(equalTo: otherTopAnchor, constant: -margin)
        case .Greater:
            constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: otherTopAnchor, constant: -margin)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func aboveTo(
        _ other: UIView,
        margin: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        aboveConstraint(other: other, margin: margin, type: type, safeArea: safeArea)
        
        return self
    }
    
    @discardableResult func underConstraint(
        other: UIView,
        margin: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let otherBotAnchor = safeArea ?
            other.safeAreaLayoutGuide.bottomAnchor :
            other.bottomAnchor
        
        switch(type) {
        case .Lesser:
            constraint = self.topAnchor.constraint(lessThanOrEqualTo: otherBotAnchor, constant: margin)
        case .Equal:
            constraint = self.topAnchor.constraint(equalTo: otherBotAnchor, constant: margin)
        case .Greater:
            constraint = self.topAnchor.constraint(greaterThanOrEqualTo: otherBotAnchor, constant: margin)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func underTo(
        _ other: UIView,
        margin: CGFloat = 0,
        type: ConstraintType = .Equal,
        safeArea: Bool = true
    ) -> UIView {
        
        underConstraint(other: other, margin: margin, type: type, safeArea: safeArea)
        
        return self
    }
    
    //MARK: Size
    
    //MARK: Size Direct
    
    @discardableResult func widthConstraint(
        constant: CGFloat,
        type: ConstraintType = .Equal,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint
        
        switch(type) {
        case .Lesser:
            constraint = self.widthAnchor.constraint(lessThanOrEqualToConstant: constant)
        case .Equal:
            constraint = self.widthAnchor.constraint(equalToConstant: constant)
        case .Greater:
            constraint = self.widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func widthTo(
        constant: CGFloat,
        type: ConstraintType = .Equal
    ) -> UIView {
        
        widthConstraint(constant: constant, type: type)
        
        return self
    }
    
    @discardableResult func heightConstraint(
        constant: CGFloat,
        type: ConstraintType = .Equal,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint
        
        switch(type) {
        case .Lesser:
            constraint = self.heightAnchor.constraint(lessThanOrEqualToConstant: constant)
        case .Equal:
            constraint = self.heightAnchor.constraint(equalToConstant: constant)
        case .Greater:
            constraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
        }
        
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult func heightTo(
        constant: CGFloat,
        type: ConstraintType = .Equal
    ) -> UIView {
        heightConstraint(constant: constant, type: type)
        return self
    }
    
    //MARK: Size Relative
    
    @discardableResult func equalWidthConstraint(
        other: UIView,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint
        
        let otherWidthAnchor = safeArea ?
        other.safeAreaLayoutGuide.widthAnchor :
        other.widthAnchor
        
        switch(type) {
        case .Lesser:
            constraint = self.widthAnchor.constraint(lessThanOrEqualTo: otherWidthAnchor, multiplier: multiplier, constant: constant)
        case .Equal:
            constraint = self.widthAnchor.constraint(equalTo: otherWidthAnchor, multiplier: multiplier, constant: constant)
        case .Greater:
            constraint = self.widthAnchor.constraint(greaterThanOrEqualTo: otherWidthAnchor, multiplier: multiplier, constant: constant)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func equalWidthTo(
        _ other: UIView,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        safeArea: Bool = true,
        type: ConstraintType = .Equal
    ) -> UIView {
        
        equalWidthConstraint(other: other, constant: constant, multiplier: multiplier , type: type, safeArea: safeArea)
        
        return self
    }
    
    @discardableResult func equalHeightConstraint(
        other: UIView,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        type: ConstraintType = .Equal,
        safeArea: Bool = true,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint
        
        let otherHeightAnchor = safeArea ?
        other.safeAreaLayoutGuide.heightAnchor :
        other.heightAnchor
        
        switch(type) {
        case .Lesser:
            constraint = self.heightAnchor.constraint(lessThanOrEqualTo: otherHeightAnchor, multiplier: multiplier, constant: constant)
        case .Equal:
            constraint = self.heightAnchor.constraint(equalTo: otherHeightAnchor, multiplier: multiplier, constant: constant)
        case .Greater:
            constraint = self.heightAnchor.constraint(greaterThanOrEqualTo: otherHeightAnchor, multiplier: multiplier, constant: constant)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult func equalHeightTo(
        _ other: UIView,
        constant: CGFloat = 0,
        multiplier: CGFloat = 1,
        safeArea: Bool = true,
        type: ConstraintType = .Equal
    ) -> UIView {
        
        equalHeightConstraint(other: other, constant: constant, multiplier: multiplier , type: type, safeArea: safeArea)
        
        return self
    }
    
    //MARK: Helpers
    
    @discardableResult func pinTo(
        _ other: UIView,
        padding: CGFloat = 0,
        safeArea: Bool = true
    ) -> UIView {
        
        self.activateConstraints()
            .alignTopTo(other, padding: padding, safeArea: safeArea)
            .alignLeftTo(other, padding: padding, safeArea: safeArea)
            .alignRightTo(other, padding: padding, safeArea: safeArea)
            .alignBotTo(other, padding: padding, safeArea: safeArea)
        
        return self
    }
    
    
    @discardableResult func aspectRatioConstraint(
        _ multiplier: CGFloat = 1,
        activated: Bool = true
    ) -> NSLayoutConstraint {
        
        let constraint = self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier)
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult func aspectRatio(
        _ multiplier: CGFloat = 1
    ) -> UIView {

        self.aspectRatioConstraint(multiplier, activated: true)
        return self
    }
    
}
