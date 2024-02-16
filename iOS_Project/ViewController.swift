//
//  ViewController.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 9/2/24.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Life Cycle
    
    override func loadView() {
        super.loadView()
        // This functon is called when view is still nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Here can call to api calls or setup view object with external dat
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This function is called before the view appears on screen
        // Sizes and positions of objects aren't calculated yet
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // This function is called before the view's size changes (before calculating sub view's sizes and positions)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // This function is called after the view's size changes (before calculating sub view's sizes and positions)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // This function is called after the view appears on screen
        // Sizes and positions of objects are calculated
    }
    
    deinit {
        // Useful to unsubscribe from events
    }

    
    
    // MARK: Functions
    
    func defineFunctionTest(varName: Int /* Type */) -> Int /* Returned Value */ {
        return 0
    }
    
    @discardableResult
    func defineFunctionNoWarning(varName: Int /* Type */) -> Int /* Returned Value */ {
        return 0
    }
    
    
    
    // MARK: Variable Types
    
    func testFariables() {
        var a : Int = 0
        a += 1
        
        let b : Int = 0
        // Left side of mutating operator isn't mutable: 'b' is a 'let' constant
        //b += 2
    }
    
    
    
    // MARK: Optionals
    
    func testOptionals() {
        var a : Int
        // Variable 'a' passed by reference before being initialized
        //a += 1
        a = 0
        a += 1
        
        var b : Int = 0
        b += 1
        
        var c : Int?
        
        // Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
        //b = c
        
        if var c = c {
            b = c
        }
        
        // 'nil' cannot be assigned to type 'Int'
        //b = nil
        c = nil
        
        b = c ?? 0
        
        guard var c = c else {
            return
        }
        
        b = c
        
    }
    
    
    
    // MARK: Classes & Protocolors
    
    class TestObject {
        var a : Int
        let b : Int
        var c : Int?
        
        init(){
            a = 0
            b = 0
        }
        
        init(a: Int, b: Int, c: Int? = nil) {
            self.a = a
            self.b = b
            self.c = c
        }
        
        func addOneToAll(){
            self.a += 1
            a += 1
            
            // Left side of mutating operator isn't mutable: 'b' is a 'let' constant
            //self.b += 1
            
            // Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
            //self.c += 1
            
            // Incorrect Solution !!!!
            //self.c! += 1
            
            if var c = c {
                c += 1
            }
        }
    }
    
    func testClass() {
        var nonOptionalClass = TestObject()
        
        // 'nil' requires a contextual type
        //var optionalClass = nil
        
        var optionalClass : TestObject? = nil
        
        nonOptionalClass.addOneToAll()
        
        // If the class is nil, the function isn't called and no error is thrown
        optionalClass?.addOneToAll()
        
        // Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
        //nonOptionalClass.a = optionalClass?.a
        
        nonOptionalClass.a = optionalClass?.a ?? 1
        
        if let optionalClass = optionalClass {
            nonOptionalClass.a = optionalClass.a
        }
        
        if optionalClass != nil {
            var i = 0
        }
        
        guard let optionalClass = optionalClass else {
            return
        }
        
        nonOptionalClass.a = optionalClass.a
                
        
    }
    
    

}





extension ViewController.TestObject {
    
    // Extensions must not contain stored properties
    //var d : Int
    
    func subtractOneToAll() {
        a -= 1
        c = (c ?? 0) - 1
    }
}

extension ViewController {
    
    func testExtension() {
        var extendedObject = TestObject()
        extendedObject.subtractOneToAll()
    }
}




protocol RedeableAsText {
    
    // Property in protocol must have explicit { get } or { get set } specifier
    //var text : String = ""
    
    var Text : String { get }
    
    func toText() -> String
}

extension ViewController.TestObject : RedeableAsText {
    var Text: String {
        return toText()
    }
    
    func toText() -> String {
        var s = ""
        s += "The variable A is \(a) \n"
        s += "The variable B is " + b.formatted() + "\n"
        s += "The variable C is \(c)"
        
        return s
    }
    
    
}

extension ViewController {
    
    func testProtocol(){
        var extendedObject = TestObject()
        var aString = extendedObject.Text
        var bString = extendedObject.toText()
    }
}




// MARK: Iterations

extension ViewController {
    
    func testIterations() {
        
        var list : [Int] = []
        list.append(0)
        list.append(1)
        list.append(2)
        list.append(3)
        
        list.forEach { item in
            print(item)
            debugPrint(item)
        }
        
        print(list)
        debugPrint(list)
        
        for item in list {
            print(item)
        }
        
        for i in 0...list.count {
            print(list[i])
        }
        
        var otherList = [Int](0...100)
        
        for number in otherList where number % 2 == 0 {
            print(number)
        }
        
        
        var objectsClass : [TestObject] = []
        objectsClass.append(TestObject(a: 1, b: 1, c: 1))
        objectsClass.append(TestObject(a: 2, b: 2, c: nil))
        objectsClass.append(TestObject(a: 3, b: 3, c: 3))
        objectsClass.append(TestObject(a: 4, b: 4, c: nil))
        objectsClass.append(TestObject(a: 5, b: 5, c: 5))
        
        for item in objectsClass where item.c != nil {
            print(item.c)
        }
        
        
        var i = 0
        while (i < list.count) {
            print(i)
            i += 1
        }
    }
    
}
