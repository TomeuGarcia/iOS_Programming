//
//  StartVC.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 22/3/24.
//

import Foundation
import UIKit

struct NoPointerStruct : Equatable {
    private let id = UUID()
    
    static func == (lhs: NoPointerStruct, rhs: NoPointerStruct) -> Bool {
        return lhs.id == rhs.id
    }
}

class PointerClass : Equatable {
    static func == (lhs: PointerClass, rhs: PointerClass) -> Bool {
        return lhs === rhs
    }
}


class StartVC : VC {
    
    let count = Observable<Int>(0)
    let health = Observable<Int>(27) { lastValue, newValue in
        return (newValue >= 0) ? newValue : 0
    }
    
    let heroes = Observable<[Hero]>([])
    
    
    lazy var countButton: Button = {
        let button = Button(Label("0"))
        
        self.view.addSubview(button)
        button.alignVerticalTo(self.view)
            .alignHorizontalTo(self.view)
        
        button.backgroundColor = .black
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray

        
        let obsIdCount = self.count.addObservation { lastValue, newValue in
            self.countButton.label?.text =
            "Count: \(newValue) Health:  \(self.health.Value)"
        }

        let obsIdHealth = self.health.addObservation { lastValue, newValue in
            self.countButton.label?.text =
            "Count: \(self.count.Value) Health:  \(newValue)"
        }
        
        
        self.countButton.onClick = {
            self.count.Value += 1
            self.health.Value -= 5
            
            self.count.removeObservation(id: obsIdCount)
            self.health.removeObservation(id: obsIdHealth)
        }
        
        
        let obsList = ObservableArray<Int>([1,2,3])
        obsList.addObservation { lastValue, newValue, affectedValue in
            debugPrint(newValue)
        }
        
        debugPrint(obsList[0])
        obsList[0] = 10
        
        
        let obsPointerList = ObservableArray<PointerClass>([])
        //obsPointerList.firstIndexOf()

        let obsNoPointerList = ObservableArray<NoPointerStruct>([])
        //obsNoPointerList.firstIndexOf()
    }
    
    
    private func testCodeUI() {
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
        appleImageView.image = .testSVG
        //appleImageView.image = #imageLiteral(resourceName: "TestSVG")
        
        v4.addSubview(appleImageView)
        appleImageView.activateConstraints()
            .pinTo(v4)
    }
    
}
