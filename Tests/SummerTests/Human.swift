//
//  File.swift
//  
//
//  Created by Hui Li on 2021/9/6.
//

import Foundation
import Summer

struct HumanStruct {
    var pet: Animal?
    
    func play() {
        pet?.makeNoise()
    }
}

class HumanClass {
    
    @Autowired(name: "cat")
    var cat: Animal?
    
    func play() {
        cat?.makeNoise()
    }
    
}

protocol ParentProtocol {
    
}

protocol ChildProtocol {
    
    func printChild()
    
}

class Parent: ParentProtocol {
    
    @Autowired
    var child: ChildProtocol?
    
    public func test() {
        child?.printChild()
    }
    
}

class Child: ChildProtocol {

    @Autowired
    var parent: ParentProtocol?
    
    func printChild() {
        print("child")
    }
}
