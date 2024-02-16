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

